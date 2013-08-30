# OmniAuth Youku OAuth2

Youku OAuth2 Strategy for OmniAuth 1.0.

Read Youku OAuth2 docs for more details: http://open.youku.com/docs/%E6%8A%80%E6%9C%AF%E6%96%87%E6%A1%A3/api%E6%96%87%E6%A1%A3#oauth2授权_oauth2

## Installing

Add to your `Gemfile`:

```ruby
gem 'omniauth-youku-oauth2'
```

Then `bundle install`.

Or install it yourself as:

    $ gem install omniauth-youku-oauth2

## Usage

`OmniAuth::Strategies::Youku` is simply a Rack middleware. Read the OmniAuth 1.0 docs for detailed instructions: https://github.com/intridea/omniauth.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :youku, ENV['YOUKU_KEY'], ENV['YOUKU_SECRET']
end
```

## Authentication Hash

Here's an example *Authentication Hash* available in `request.env['omniauth.auth']`:

```ruby
{
  :provider => 'youku',
  :uid => '87919223',
  :info => {
    :nickname => 'okingskyo',
    :name => 'okingskyo',
    :location => '',
    :image => 'http://static.youku.com/v1.0.0742/user/img/head/150/999.jpg',
    :description => '我勒个去'
  },
  :credentials => {
    :token => '11d0b7627154f0dd000e6084f3811598', # OAuth 2.0 access_token, which you may wish to store
    :expires_at => 3600, # when the access token expires (if it expires)
    :expires => true # if you request `offline_access` this will be false
  },
  :extra => {
    :raw_info => {
      ... # data from /users/myinfo.json, check by yourself
    }
  }
}
```
*PS.* Built and tested on MRI Ruby 1.9.3

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request