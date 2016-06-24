class String
  def camel_case_lower
    self.split('_').inject([]){ |buffer,e| buffer.push(buffer.empty? ? e : e.capitalize) }.join
  end
end

module Paytm
  module Request

    module ClassMethods
      def send_request(method, url, request_params, optional_params)
        params = {}
        request_params = Hash[request_params.map{ |k, v| [k.to_s.camel_case_lower, v] }]
        optional_params = Hash[optional_params.map{ |k, v| [k.to_s.camel_case_lower, v] }]
        params['request'] = request_params
        params.merge!(optional_params)
        Paytm.request(method, url, params)
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end

  end
end