require 'uri'

module Lita
  module Handlers
    # Checks if a website is down or not.
    class Down < Handler
      HTTP_PREFIX = 'http://'.freeze
      HTTP_HTTPS_REGEX = %r{^http(s)?://}
      HELP = { 'Is example.com down?' => 'Checks if example.com is down.' }.freeze

      route(/^Is\s+(?<host>.+)\s+down\?/i, :down, help: HELP)

      def down(response)
        host = response.match_data[:host]
        host.prepend(HTTP_PREFIX) unless host.match(HTTP_HTTPS_REGEX)
        uri = URI.parse(host)

        if reachable?(uri)
          response.reply("It's just you. #{uri.host} is up.")
        else
          response.reply("It's not just you! #{uri.host} looks down from here.")
        end
      end

      private

      def reachable?(uri)
        !!http.head(uri)
      rescue
        false
      end

      Lita.register_handler(self)
    end
  end
end
