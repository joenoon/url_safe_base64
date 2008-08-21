module Statim
  module UrlSafeBase64StringExtension
    def url_safe_encode64
      UrlSafeBase64.encode64(self)
    end

    def url_safe_decode64
      UrlSafeBase64.decode64(self)
    end
  end
end
