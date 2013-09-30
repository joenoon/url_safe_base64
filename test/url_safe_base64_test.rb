require 'test/unit'
require File.join(File.dirname(__FILE__),"..","lib","url_safe_base64.rb")

class UrlSafeBase64Test < Test::Unit::TestCase
  
  TEST_STRING = "abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ 1234567890 !@#$%^&*()-=_+/?.:;[]{}\|"
  TEST_STRING_ENCODED_BASE64 = "YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXogQUJDREVGR0hJSktMTU5PUFFS\nU1RVVldYWVogMTIzNDU2Nzg5MCAhQCMkJV4mKigpLT1fKy8/Ljo7W117fXw=\n"
  TEST_STRING_ENCODED_BASE64_URL = "YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXogQUJDREVGR0hJSktMTU5PUFFSU1RVVldYWVogMTIzNDU2Nzg5MCAhQCMkJV4mKigpLT1fKy8_Ljo7W117fXw"

  MOD_GROUPS = {
    "2" => [TEST_STRING+'AB', TEST_STRING+'ABCDE'],
    "3" => [TEST_STRING, TEST_STRING+'ABC'],
    "0" => [TEST_STRING+'A', TEST_STRING+'ABCD']
  }
  
  def test_the_test
    result = Base64.encode64(TEST_STRING)
    assert_equal TEST_STRING_ENCODED_BASE64, result
    result = Base64.decode64(result)
    assert_equal TEST_STRING, result
  end

  def test_url_safe_base64_on_png
    result = UrlSafeBase64.encode64(TEST_STRING)
    assert_equal TEST_STRING_ENCODED_BASE64_URL, result
    result = UrlSafeBase64.decode64(result)
    assert_equal TEST_STRING, result
  end

  def test_mod_groups
    MOD_GROUPS.keys.each do |key|
      MOD_GROUPS[key].each do |str|
        result = UrlSafeBase64.encode64(str)
        result = UrlSafeBase64.decode64(result)
        assert_equal str, result
      end
    end
  end

  def test_for_correct_mod_values
    MOD_GROUPS.keys.each do |key|
      MOD_GROUPS[key].each do |str|
        assert_equal key.to_i, UrlSafeBase64.encode64(str).length.modulo(4)
      end
    end
  end

end
