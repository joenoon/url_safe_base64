require 'test/unit'
require File.join(File.dirname(__FILE__),"..","lib","url_safe_base64.rb")

class UrlSafeBase64Test < Test::Unit::TestCase
  
  TEST_FILE = File.read(File.join(File.dirname(__FILE__),"test_png.png"))
  TEST_NORM_ENCODE64 = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAIAAACQkWg2AAAAGXRFWHRTb2Z0\nd2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAjpJREFUeNpMUs9LG1EQnmw2\n260lalIqadIVqSHQNpKAGL2JBoTSBkIPuXnqyUvAP0JPgvVQ8JZa6NFADoGI\n6UHwaEBUSE2kJErp2nSbXek2+yN56+RtNnQYlvdmvm/fzDfjsiwL/rPf9Xq1\nWPxVreL58fR0eHk5NDs7zLrQLGp4ka6uCtlsrVRiMEHTGCUAzxKJd7u7wXh8\nwCEEg/D96OhzOq0rCgfAAjAOugdgYprjMnt7sUym/wISWpeXHxcWTEXhATSe\nV3l+VNfHOx0kdAEM6oTj3pdKzxcX+4RcKlUrFh8CNAIBEotNhsNis8mcnLwS\nRZO+oAN0AJ5Eo9lKhRXPz79RtOz1epeWVtfXPR4PdvVlZ+dnoRCUZbsZrE28\nuKgdHDD1w0OGFi36fIlkEtOGYUiS9GJ+vunzsU5LbuoIZuWbm8GdEFPTTBN7\nUVRVlSWJJcTloO2fytfXbFfXbb2EdvtrPv/I7we3+0+rVSmXI+22Xc9wUl3T\nZMdCIVs+v6r+PTv7tLHhm5hQWq3I7e3Tu7suTRHHR4NB14/T0w/xOAqK/oBW\n/I/KylhWj8pqUllRJQ1gdX+fCczMTOIQnAR+eU3rWZZB1RwGkTkmCJGVFewE\n3m5vWxynU4SN0x30MILnN1tbbo7rE4S5uUwuh7PU6Lv2mDpOGRrlvN7cjKbT\ng9Ww969xfJxfW8M9dTvLZ4sxLghYwstUymXbkIBGej3c1nq53G40TMPwT01N\nJ5NYNzcygkh7ve8FGACA/yuDGxf1iwAAAABJRU5ErkJggg==\n"
  TEST_SAFE_EXPECTED = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAIAAACQkWg2AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAjpJREFUeNpMUs9LG1EQnmw2260lalIqadIVqSHQNpKAGL2JBoTSBkIPuXnqyUvAP0JPgvVQ8JZa6NFADoGI6UHwaEBUSE2kJErp2nSbXek2-yN56-RtNnQYlvdmvm_fzDfjsiwL_rPf9Xq1WPxVreL58fR0eHk5NDs7zLrQLGp4ka6uCtlsrVRiMEHTGCUAzxKJd7u7wXh8wCEEg_D96OhzOq0rCgfAAjAOugdgYprjMnt7sUym_wISWpeXHxcWTEXhATSeV3l-VNfHOx0kdAEM6oTj3pdKzxcX-4RcKlUrFh8CNAIBEotNhsNis8mcnLwSRZO-oAN0AJ5Eo9lKhRXPz79RtOz1epeWVtfXPR4PdvVlZ-dnoRCUZbsZrE28uKgdHDD1w0OGFi36fIlkEtOGYUiS9GJ-vunzsU5LbuoIZuWbm8GdEFPTTBN7UVRVlSWJJcTloO2fytfXbFfXbb2EdvtrPv_I7we3-0-rVSmXI-22Xc9wUl3TZMdCIVs-v6r-PTv7tLHhm5hQWq3I7e3Tu7suTRHHR4NB14_T0w_xOAqK_oBW_I_KylhWj8pqUllRJQ1gdX-fCczMTOIQnAR-eU3rWZZB1RwGkTkmCJGVFewE3m5vWxynU4SN0x30MILnN1tbbo7rE4S5uUwuh7PU6Lv2mDpOGRrlvN7cjKbTg9Ww969xfJxfW8M9dTvLZ4sxLghYwstUymXbkIBGej3c1nq53G40TMPwT01NJ5NYNzcygkh7ve8FGACA_yuDGxf1iwAAAABJRU5ErkJggg"

  MOD_GROUPS = {
    "0" => [TEST_FILE+'AB', TEST_FILE+'ABCDE'],
    "2" => [TEST_FILE, TEST_FILE+'ABC'],
    "3" => [TEST_FILE+'A', TEST_FILE+'ABCD']
  }
  
  def test_the_test
    result = Base64.encode64(TEST_FILE)
    assert_equal TEST_NORM_ENCODE64, result
    result = Base64.decode64(result)
    assert_equal TEST_FILE, result
  end

  def test_url_safe_base64_on_png
    result = UrlSafeBase64.encode64(TEST_FILE)
    assert_equal TEST_SAFE_EXPECTED, result
    result = UrlSafeBase64.decode64(result)
    assert_equal TEST_FILE, result
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
