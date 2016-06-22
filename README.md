# Paytm

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/Paytm`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'Paytm'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install Paytm

## Usage

  **Setup your Paytm Account by placing the following code** 
    
    Paytm.setup(merchant-guid, sales-wallet-guid, aes-key, :test)
    
    or
    
    Paytm.setup(merchant-guid, sales-wallet-guid, aes-key, :production)
    
  **Credit To user Wallet using**  
    
    Paytm::Gratification.credit_to_user({request_type: 'null', merchant_order_id: 'Ronak1111122222', payee_email_id:'', payee_phone_number: '7777777777', payee_sso_id: '', applied_to_new_users: 'Y', amount: '10', currency_code: 'INR'},{methodadata: 'Testing Data'})

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/Paytm. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

