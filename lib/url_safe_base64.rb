require 'base64'

module UrlSafeBase64

  def self.encode64(str)
    Base64.encode64(str).gsub(/[\s=]+/, "").tr('+/','-_')
  end
  
  def self.decode64(str)
    str += '=' * (4 - str.length.modulo(4))
    Base64.decode64(str.tr('-_','+/'))
  end
    
end
