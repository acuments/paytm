require 'spec_helper'

describe Paytm do

  config_keys = [ :guid,
                  :aes_key,
                  :mode,
                  :open_timeout,
                  :read_timeout,
                  :test_url,
                  :production_url
  ]

  config_keys.each do |key|
    describe "##{key}" do
      it "can be set to a value" do
        Paytm.send("#{key}=","some string value")
        expect(Paytm.send(key)).to eq("some string value")
      end
    end
  end

  describe "#setup" do
    it "should be configurable with an setup method" do
      Paytm.setup('12345', '67890', '1122334455', :production)
      (expect(Paytm.mode).to_not be_nil) && (expect(Paytm.aes_key).to_not be_nil) && (expect(Paytm.guid).to_not be_nil)
    end
  end

end