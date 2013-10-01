# UrlSafeBase64

Copyright (c) 2008 Joe Noon, released under the MIT license

Converts strings to/from a slightly modified base64 that contains only url-safe characters

## Installation

Add this line to your application's Gemfile:

    gem 'url_safe_base64'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install url_safe_base64

## Usage

Normal Base64:

```ruby
Base64.encode64 "Test string"                    #=> "VGVzdCBzdHJpbmc=\n"
```

```ruby
Base64.decode64 "VGVzdCBzdHJpbmc=\n"             #=> "Test string"
```

With this gem:

```ruby
UrlSafeBase64.encode64 "Test string"             #=> "VGVzdCBzdHJpbmc"
```

```ruby
UrlSafeBase64.decode64 "VGVzdCBzdHJpbmc=\n"      #=> "Test string"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
