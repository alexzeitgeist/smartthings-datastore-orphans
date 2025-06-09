-- Copyright (c) 2023 SmartThings.
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

local log = require "log"
local security_api = _envlibrequire("security")
local json = require "st.json"
local base64 = require "base64"
local utils = require "st.utils"

--- @module security
local security = {}

security.SECRET_KIND_AQARA = "aqara"

--- Helper function to check to see if this interface is supported on this system
---
--- Throws an error if the security api interface is not supported on this version of smartthings firmware.
local function _check_support()
  if not security_api then
    error("Security functionality is not available on this SmartThings Hub")
  end
end

--- Helper function to check to see if generate_self_signed_cert is supported on this system
---
--- Throws an error if the security api interface or generate_self_signed_cert function is not
--- supported on this version of smartthings firmware.
local function _check_self_signed_cert_support()
  _check_support()
  if not security_api.generate_self_signed_cert then
    error("Generate self-signed certificate functionality is not available on this SmartThings Hub")
  end
end

--- Helper function to check to see if the digest native functions are supported on this system
---
--- Throws an error if the security api interface or digest functions are not supported on this
--- version of smartthings firmware.
local function _check_digest_support()
  _check_support()
  if not security_api.available_digests then
    error("Digest functionality is not available on this SmartThings Hub")
  end
end

--- Request a secret from the system
---
--- This api is currently restricted to certain drivers authored by partners and has limited/no utility outside of those drivers.
---
--- @param kwargs table Controls what secret and how a secret is obtained by a driver
--- @return GetSecretResponse|nil the response to the request to get secret
--- @return nil|string error message if any
function security.get_secret(kwargs)
  _check_support()
  if kwargs == nil then kwargs = {} end
  if type(kwargs) ~= "table" then
    error("table required for optional arguments")
  end
  local success, kwargs_json = pcall(json.encode, kwargs)
  if not success then
    error("Error while parsing args", -1)
  end
  return security_api.get_secret(kwargs_json)
end

--- Request aqara secret
---
--- This function will only return whether or not the request had valid formatting, the response will come as an event on a registered secret_data_handler
--- see register_secret_data_handler.
---
--- @param zigbee_eui String Zigbee device unique id as a raw byte string
--- @param encrypted_pub_key String device's encrypted public key as a raw byte string
--- @param model_name String the model name for the device
--- @param mn_id String used in key fetch query
--- @param setup_id String used in key fetch
--- @param product_id String used in key fetch
--- @return GetSecretResponse|nil the response to the request to get secret
--- @return nil|string error message if any
function security.get_aqara_secret(zigbee_eui, encrypted_pub_key, model_name, mn_id, setup_id, product_id)
  _check_support()
  if not zigbee_eui or type(zigbee_eui) ~= "string" or #zigbee_eui ~= 8 then
    error("8 bytes zigbee_eui string required!")
  end
  if not encrypted_pub_key or type(encrypted_pub_key) ~= "string" then
    error("missing or incorrect type for encrypted pub key")
  end
  if not model_name or type(model_name) ~= "string" then
    error("missing or incorrect type for model name")
  end
  if not mn_id or type(mn_id) ~= "string" then
    error("missing or incorrect type for mn_id")
  end
  if not setup_id or type(setup_id) ~= "string" then
    error("missing or incorrect type for setup_id")
  end
  if not product_id or type(product_id) ~= "string" then
    error("missing or incorrect type for product_id")
  end
  local kwargs = {
    secret_kind = security.SECRET_KIND_AQARA,
    zigbee_eui = utils.bytes_to_hex_string(zigbee_eui),
    encrypted_pub_key = base64.encode(encrypted_pub_key),
    model_name = model_name,
    mn_id = mn_id,
    setup_id = setup_id,
    product_id = product_id,
  }
  return security.get_secret(kwargs)
end

--- Look up a device for the given security event
---
--- Will look up a device from the driver's device cache that matches the information in the secret data
--- @param driver Driver this driver
--- @param secret_data table The secret data
function security.get_device_for_event(driver, secret_data)
  _check_support()
  if secret_data.secret_kind == security.SECRET_KIND_AQARA then
    for _, dev in pairs(driver.device_cache) do
      if dev.zigbee_eui and utils.bytes_to_hex_string(dev.zigbee_eui) == secret_data.device_serial_number then
        return dev
      end
    end
    error(string.format("Failed to find match for device: %s", secret_data.device_serial_number))
  else
    error(string.format("Unknown secret kind %s, can't determine device", secret_data.secret_kind))
  end
end

--- Register a secret data handler
---
--- This function will replace the top-level default handlers specified in the driver with the provided handlers
--- @param driver Driver This driver
--- @param secret_kind String The kind of secret to look for
--- @param handler function Function to call when a secret is recieved
function security.register_secret_data_handler(driver, secret_kind, handler)
  _check_support()
  if type(secret_kind) ~= "string" then
    error("Secret missing or wrong type (expected string)")
  end
  if not handler or type(handler) ~= "function" then
    error("Handler missing or wrong type (expected function)")
  end
  driver.secret_data_dispatcher.default_handlers[secret_kind] = handler
end

--- Register a handler for aqara secrets
---
--- .. note::
---    Registering a handler this way will overwrite any top-level default handler registered as part of a driver template!
---
--- It's more advisable to utilize the handler functionality rather than registering directly:
---   local my_secret_handler = function(driver, device, secret_data)
---     ...
---   end
---   secret_data_handlers = {
---     [security.SECRET_KIND_AQARA] = my_secret_handler
---   }
---
--- @param driver Driver This driver
--- @param handler function Function (driver, device, secret_data) to call when a secret is received
function security.register_aqara_secret_handler(driver, handler)
  _check_support()
  security.register_secret_data_handler(driver, security.SECRET_KIND_AQARA, handler)
end

--- Get the list of available ciphers
---
--- @return table A list of strings indicating supported ciphers
function security.available_ciphers()
  _check_support()
  return security_api.available_ciphers()
end

--- Encrypt bytes
---
--- Encrypt a string of bytes using the given key. This function calls into the native interface of the runtime to run
--- the actual encryption algorithm for performance reasons. The opts table configures the parameters of the encryption.
---
--- The Opts Table:
---   Currently the supported key:values are:
---     "cipher": <one of the ciphers returned by the available_ciphers function>
---     "padding" : bool
---     "iv" : initialization vector (16 bytes)
---
--- Errors:
---   Errors are caught by this interface and returned to the caller. The error strings are full tracebacks of the
---   failure. Common errors are:
---     * A key that is not the correct length for a given cipher
---     * The opts table indicates a cipher that is not supported by the implementation
---     * An IV is passed in that is not equal to the block length
---     * Input data length is not a multiple of the block length
---
--- Note: This api is currently limited to the list of ciphers returned by the available_ciphers() function.
---
--- @param data string The data to be encrypted
--- @param key string The key material
--- @param opts table Additional options/configurations
--- @return String|nil Encrypted bytes
--- @return nil|String Encryption error message if any
function security.encrypt_bytes(data, key, opts)
  _check_support()
  local status, result = pcall(security_api.encrypt_bytes, data, key, opts)
  if status then
    return result, nil
  else
    return nil, result
  end
end

--- Decrypt bytes
---
--- Encrypt a string of bytes using the given key. This function calls into the native interface of the runtime to run
--- the actual encryption algorithm for performance reasons. See encrypt_bytes for more details.
---
--- @param data string The data to be decrypted
--- @param key string The key material
--- @param opts table Additional options/configurations
--- @return String|nil Decrypted bytes in String or nil if there was an error.
--- @return nil|String Decryption error message if any
function security.decrypt_bytes(data, key, opts)
  _check_support()
  local status, result = pcall(security_api.decrypt_bytes, data, key, opts)
  if status then
    return result, nil
  else
    return nil, result
  end
end

--- Generate a self-signed TLS certificate.
---
--- This function calls into the native interface of the runtime to create the certificate.
---
--- `request_opts` should be a table with entries:
---
---   * `return_formats` (table): Must contain at least one of `pem = true` or `der = true`.
---
---   * `key_algorithm` (table): Must be `{key = "ec", curve = "prime256v1"}`. Currently, only
--      NIST curve P-256 is supported.
---
---   * `signature_algorithm` (string): Must be "sha256".
---
---   * `subject` (table): The subject and issuer name for the cert.
---     Must contain an entry `common_name` with string value.
---
---   * `validity_days` (number): Number of days that the cert will be valid.
---     The NotBefore date is set to the current datetime.
---
---   * `x509_extensions` (table): Optional entry that may contain the following optional entries:
---
---     * `key_usage` (table): May optionally include boolean entries `critical`
---       and `digital_signature` (both default to `false`).
---
---     * `certificate_policies` (table): May optionally include boolean entries `critical`
---       and `policy_2030_5_self_signed_client` (both default to `false`). Note that
---       `policy_2030_5_self_signed_client` enables the required policy for the IEEE 2030.5
---       specification, and should not be used outside of that context. This is the only policy
---       that is currently supported.
---
--- Upon success, returns a table with string entries `cert_pem` and `key_pem` (for PEM format)
--- and/or `cert_der` and `key_der` (for DER format).
---
--- @param request_opts table Configuration for the generated cert/key pair
--- @return table|nil Generated certificate and key in PEM and/or DER format, or nil if an error occurred.
--- @return nil|string Error message if any
function security.generate_self_signed_cert(request_opts)
  _check_self_signed_cert_support()
  local status, result = pcall(security_api.generate_self_signed_cert, request_opts)
  if status then
    return result, nil
  else
    return nil, result
  end
end

--- Get the list of available digests
---
--- @return table A list of strings indicating supported digest algorithms
function security.available_digests()
  _check_digest_support()
  return security_api.available_digests()
end

--- Calculate the digest of the input data
---
--- This API is currently limited to the algorithms returned by the `available_digests()` function.
---
--- @param algo string The digest algorithm to use
--- @param data string Input data
--- @return string|nil The digest of the input data in binary form, or nil if an error occurred
--- @return nil|string Error message if any
function security.digest(algo, data)
  _check_digest_support()
  local status, result = pcall(security_api.digest, algo, data)
  if status then
    return result, nil
  else
    return nil, result
  end
end

--- Calculate the hex-encoded digest of the input data
---
--- This API is currently limited to the algorithms returned by the `available_digests()` function.
---
--- @param algo string The digest algorithm to use
--- @param data string Input data
--- @return string|nil The hex-encoded digest of the input data, or nil if an error occurred
--- @return nil|string Error message if any
function security.hexdigest(algo, data)
  _check_digest_support()
  local status, result = pcall(security_api.hexdigest, algo, data)
  if status then
    return result, nil
  else
    return nil, result
  end
end

return security
