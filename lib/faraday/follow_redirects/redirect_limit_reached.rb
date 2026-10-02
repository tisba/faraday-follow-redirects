# frozen_string_literal: true

require 'faraday'

module Faraday
  module FollowRedirects
    # Exception thrown when the maximum amount of requests is
    # exceeded.
    class RedirectLimitReached < Faraday::ClientError
      attr_reader :response, :next_location

      def initialize(response, next_location)
        @next_location = next_location
        @response = response

        super("too many redirects; last one to: #{@next_location}")
      end
    end
  end
end
