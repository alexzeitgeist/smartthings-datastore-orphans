---@module ssl
local module = _envlibrequire "ssl"

--- @class CertificateTable
---
--- @field public certificate string The certificate
--- @field public key string Optional private key, should only be set in 1 of the certificates list
--- @field public password string Optional password
---
--- Both the certificate and key field can either be a relative path pointing to a file in the driver package or
--- the contents as a string formatted in the PEM format.
local cert_table

--- @class SslConfig
---
--- @field public mode string client or server
--- @field public protocol string any
--- @field public cafile string The contents of the certificate authority's root cert or relative path to the root cert file
--- @field public capath string A path to the certificate authority directory
--- @field public certificates CertificateTable[] list of certificates
--- @field public verify string One of none, peer, fail_if_no_peer_cert, or client_once
--- @field public depth integer The depth to verify
--- @field public options string[] "all" | "allow_unsafe_legacy_renegotiation" | "cipher_server_preference" | "cookie_exchange" | "dont_insert_empty_fragments" | "no_compression" | "no_dtlsv1" | "no_dtlsv1_2" | "no_query_mtu" | "no_session_resumption_on_renegotiation" | "no_ssl_mask" | "no_sslv2" | "no_sslv3" | "no_ticket" | "no_tlsv1" | "no_tlsv1_1" | "no_tlsv1_2" | "single_dh_use" | "single_ecdh_use" | "tls_rollback_bug"
local ssl_config

--- Wrap a socket with a TLS Stream
--- @function wrap
--- @param sock table
--- @param config SslConfig
--- @return socket.ssl
local wrap

return module
