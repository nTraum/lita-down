require "uri"

module Lita
  module Handlers
    class Down < Handler
      HTTP_PREFIX = "http://"
      HTTP_HTTPS_REGEX = /^http(s)?:\/\//
      HELP = { "Is example.com down?" => "Checks if example.com is down." }

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
