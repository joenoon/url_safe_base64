require 'base64'
require "url_safe_base64/version"

module UrlSafeBase64
  extend self

  def encode64(str)
    Base64.encode64(str).gsub(/[\s=]+/, "").tr('+/','-_')
  end
  
  def decode64(str)
    str += '=' * (4 - str.length.modulo(4))
    Base64.decode64(str.tr('-_','+/'))
  end
    
end
