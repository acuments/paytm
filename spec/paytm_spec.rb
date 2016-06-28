require 'spec_helper'

describe Paytm, :vcr => true do
  it 'has a version number' do
    expect(Paytm::VERSION).not_to be nil
  end
end
