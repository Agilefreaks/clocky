# frozen_string_literal: true

require 'spec_helper'
require 'base64'

RSpec.describe Clocky::Operations::ParseEmail do
  let(:parse_email) { Clocky::Container['operations.parse_email'] }

  it 'will parse the email from a base 64 digest' do
    header = "Base #{Base64.encode64('costel@manelistul.com')}"
    expect(parse_email.(header).value!).to eq('costel@manelistul.com')
  end
end
