require 'openssl'
require 'rest-client'

require 'paytm/version'

require 'paytm/encryption_new_pg'
require 'paytm/request'
require 'paytm/gratification'
require 'paytm/transaction_request'


module Paytm

  @test_url = 'https://trust-uat.paytm.in'
  @production_url = 'https://trust.paytm.in'

  @open_timeout = 30
  @read_timeout = 80

  class << self
    attr_accessor :guid, :aes_key, :mode, :api_url, :test_url, :production_url, :open_timeout, :read_timeout
  end

  def self.setup(merchant_guid, sales_wallet_guid, aes_key, mode)
    self.guid = {
      merchant_guid: merchant_guid,
      sales_wallet_guid: sales_wallet_guid
    }
    self.aes_key = aes_key
    self.mode = mode
  end

  def self.api_base_url
    case mode
      when :production
        self.production_url
      when :test
        self.test_url
      else
        raise StandardError, "Integration mode set to an invalid value: #{mode}"
    end
  end

  def self.api_url(url)
    api_base_url + url
  end

  def self.request_headers(params)
    check_sum_hash = EncryptionNewPG.new_pg_checksum_by_str(params, aes_key)
    headers = {
        :user_agent => "github.com/ronakjain90/paytm/#{Paytm::VERSION}",
        :MID => guid[:merchant_guid],
        :checksumhash => check_sum_hash,
        :content_type => 'application/json'
    }
    headers
  end

  def self.request(method, url, params={})

    unless aes_key ||= @aes_key
      raise AuthenticationError.new('No AES key provided.')
    end

    request_opts = {:verify_ssl => OpenSSL::SSL::VERIFY_NONE, :use_ssl => true}

    url = api_url(url)

    case method.to_s.downcase.to_sym
      when :get, :head, :delete
        # Make params into GET parameters
        url += "#{URI.parse(url).query ? '&' : '?'}#{Util.encode_parameters(params)}" if params && params.any?
        payload = nil
      else
        payload = params.to_json
    end

    request_opts.update(:headers => request_headers(payload),
                        :method => method, :open_timeout => open_timeout,
                        :payload => payload, :url => url, :timeout => read_timeout)

    response = execute_request(request_opts)
    response
  end

  def self.clean_response(response)
    response = JSON.parse(response)
    response = response.delete_if { |_k, v| v.nil? }
    response
  end

  def self.execute_request(opts)
    response = RestClient::Request.execute(opts)
    response = clean_response(response)
  end

end
