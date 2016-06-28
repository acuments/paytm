require 'spec_helper'

describe Paytm::Gratification do
  it "should be initializable" do
    expect(Paytm::Gratification.new).to_not be_nil
  end
end