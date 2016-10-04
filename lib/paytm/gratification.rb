module Paytm
  class Gratification

    require 'socket'
    include Paytm::Request

    ip = Socket.ip_address_list.detect{|intf| intf.ipv4_private?}

    @request_params = {}
    @platform = {
        platform_name: 'PayTM',
        operation_type: 'SALES_TO_USER_CREDIT',
        ip_address: ip.ip_address,
        metadata: '',
    }

    class << self
      attr_accessor :request_params, :platform
    end

    def self.credit_to_user(params = {}, opts = {})
      request_params.merge!(params)
      platform.merge!(opts)
      request_params.merge!(Paytm.guid)
      response = send_request(:post, merchant_to_wallet_url, request_params, platform)
      response
    end

    def check_status(params = {}, opts = {})

    end

    protected

    def self.base_url
      "/wallet-web"
    end

    def self.merchant_to_wallet_url
      base_url + "/salesToUserCredit"
    end

    def self.check_status_url
      base_url + "/txnStatusList"
    end

  end
end