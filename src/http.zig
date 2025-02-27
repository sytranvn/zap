const std = @import("std");

/// HTTP Status codes according to `rfc7231`
/// https://tools.ietf.org/html/rfc7231#section-6
/// (taken from https://github.com/Luukdegram/apple_pie/blob/master/src/response.zig)
pub const StatusCode = enum(u16) {
    // Informational 1xx
    @"continue" = 100,
    // Successful 2xx
    switching_protocols = 101,
    ok = 200,
    created = 201,
    accepted = 202,
    non_authoritative_information = 203,
    no_content = 204,
    reset_content = 205,
    // redirections 3xx
    partial_content = 206,
    multiple_choices = 300,
    moved_permanently = 301,
    found = 302,
    see_other = 303,
    not_modified = 304,
    use_proxy = 305,
    temporary_redirect = 307,
    // client errors 4xx
    bad_request = 400,
    unauthorized = 401,
    payment_required = 402,
    forbidden = 403,
    not_found = 404,
    method_not_allowed = 405,
    not_acceptable = 406,
    proxy_authentication_required = 407,
    request_timeout = 408,
    conflict = 409,
    gone = 410,
    length_required = 411,
    precondition_failed = 412,
    request_entity_too_large = 413,
    request_uri_too_long = 414,
    unsupported_mediatype = 415,
    requested_range_not_satisfiable = 416,
    expectation_failed = 417,
    /// teapot is an extension status code and not required for clients to support
    teapot = 418,
    upgrade_required = 426,
    /// extra status code according to `https://tools.ietf.org/html/rfc6585#section-5`
    request_header_fields_too_large = 431,
    // server errors 5xx
    internal_server_error = 500,
    not_implemented = 501,
    bad_gateway = 502,
    service_unavailable = 503,
    gateway_timeout = 504,
    http_version_not_supported = 505,
    _,

    /// Returns the string value of a `StatusCode`
    /// for example: .ResetContent returns "Returns Content".
    pub fn toString(self: StatusCode) []const u8 {
        return switch (self) {
            .@"continue" => "Continue",
            .switching_protocols => "Switching Protocols",
            .ok => "Ok",
            .created => "Created",
            .accepted => "Accepted",
            .non_authoritative_information => "Non Authoritative Information",
            .no_content => "No Content",
            .reset_content => "Reset Content",
            .partial_content => "Partial Content",
            .multiple_choices => "Multiple Choices",
            .moved_permanently => "Moved Permanently",
            .found => "Found",
            .see_other => "See Other",
            .not_modified => "Not Modified",
            .use_proxy => "Use Proxy",
            .temporary_redirect => "Temporary Redirect",
            .bad_request => "Bad Request",
            .unauthorized => "Unauthorized",
            .payment_required => "Payment Required",
            .forbidden => "Forbidden",
            .not_found => "Not Found",
            .method_not_allowed => "Method Not Allowed",
            .not_acceptable => "Not Acceptable",
            .proxy_authentication_required => "Proxy Authentication Required",
            .request_timeout => "Request Timeout",
            .conflict => "Conflict",
            .gone => "Gone",
            .length_required => "Length Required",
            .precondition_failed => "Precondition Failed",
            .request_entity_too_large => "Request Entity Too Large",
            .request_uri_too_long => "Request-URI Too Long",
            .unsupported_mediatype => "Unsupported Media Type",
            .requested_range_not_satisfiable => "Requested Range Not Satisfiable",
            .teapot => "I'm a Teapot",
            .upgrade_required => "Upgrade Required",
            .request_header_fields_too_large => "Request Header Fields Too Large",
            .expectation_failed => "Expectation Failed",
            .internal_server_error => "Internal Server Error",
            .not_implemented => "Not Implemented",
            .bad_gateway => "Bad Gateway",
            .service_unavailable => "Service Unavailable",
            .gateway_timeout => "Gateway Timeout",
            .http_version_not_supported => "HTTP Version Not Supported",
            _ => "",
        };
    }
};

pub const Method = enum {
    GET,
    POST,
    PUT,
    DELETE,
    PATCH,
    OPTIONS,
    UNKNOWN,
};
pub fn methodToEnum(method: ?[]const u8) Method {
    {
        if (method) |m| {
            if (std.mem.eql(u8, m, "GET"))
                return Method.GET;
            if (std.mem.eql(u8, m, "POST"))
                return Method.POST;
            if (std.mem.eql(u8, m, "PUT"))
                return Method.PUT;
            if (std.mem.eql(u8, m, "DELETE"))
                return Method.DELETE;
            if (std.mem.eql(u8, m, "PATCH"))
                return Method.PATCH;
            if (std.mem.eql(u8, m, "OPTIONS"))
                return Method.OPTIONS;
        }
        return Method.UNKNOWN;
    }
}
