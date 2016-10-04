# Paytm

This is an unofficial Paytm gratification api ruby-wrapper gem. This helps you to credit money to your users wallet. It will work for a variety of usecase if you wish to reward your users, pay for a service done by them.

Get the Paytm integration done in less than 5 minutes **¯\\\_(ツ)\_/¯**

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'paytm'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paytm

## Usage

  **1) Setup your Paytm Account by placing the following code** 
    
    Paytm.setup(merchant-guid, sales-wallet-guid, aes-key, :test)
    
    or
    
    Paytm.setup(merchant-guid, sales-wallet-guid, aes-key, :production)
    
  **2) Credit To user Wallet using**  
    
    Paytm::Gratification.credit_to_user({request_type: 'null',
                                         merchant_order_id: '<unique_order_id>',
                                         payee_email_id: 'email_id_to_credit_money_to',
                                         payee_phone_number: 'recipients_phone_number',
                                         payee_sso_id: 'sso_id_of_the_reciepients_wallet',
                                         applied_to_new_users: 'Y',
                                         amount: '10',
                                         currency_code: 'INR'},
                                         {metadata: 'Testing Data'})

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ronakjain90/paytm. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## Open-source license

> Copyright (C) 2016 Ronak Jain (ronakjain90@gmail.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Trademark

All trademarks and registered trademarks are the property of their respective owners. Gem owner does not own any trademarks.