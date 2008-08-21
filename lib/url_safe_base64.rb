require 'base64'
module UrlSafeBase64
  
  def self.encode64(str)
    Base64.encode64(str).gsub(/[\s=]+/, "").gsub("+", "-").gsub("/", "_")
  end
  
  def self.decode64(str)
    case str.length.modulo(4)
    when 2
      str += '=='
    when 3
      str += '='
    end
    Base64.decode64(str.gsub("-", "+").gsub("_", "/"))
  end
    
end
