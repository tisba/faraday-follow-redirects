# frozen_string_literal: true

require_relative 'follow_redirects/middleware'
require_relative 'follow_redirects/version'

module Faraday
  # This will be your middleware main module, though the actual middleware implementation will go
  # into Faraday::FollowRedirects::Middleware for the correct namespacing.
  module FollowRedirects
    # Faraday allows you to register your middleware for easier configuration.
    # This step is totally optional, but it basically allows users to use a
    # custom symbol (in this case, `:follow_redirects`), to use your middleware in their connections.
    # After calling this line, the following are both valid ways to set the middleware in a connection:
    # * conn.use Faraday::FollowRedirects::Middleware
    # * conn.use :follow_redirects
    # Without this line, only the former method is valid.
    Faraday::Middleware.register_middleware(follow_redirects: Faraday::FollowRedirects::Middleware)

    # Alternatively, you can register your middleware under Faraday::Request or Faraday::Response.
    # This will allow to load your middleware using the `request` or `response` methods respectively.
    #
    # Load middleware with conn.request :follow_redirects
    # Faraday::Request.register_middleware(follow_redirects: Faraday::FollowRedirects::Middleware)
    #
    # Load middleware with conn.response :follow_redirects
    # Faraday::Response.register_middleware(follow_redirects: Faraday::FollowRedirects::Middleware)
  end
end
