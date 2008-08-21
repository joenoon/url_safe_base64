require 'url_safe_base64'
require 'string_ext'
unless String.included_modules.include?(Statim::UrlSafeBase64StringExtension)
  String.send :include, Statim::UrlSafeBase64StringExtension
end
