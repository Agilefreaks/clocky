# frozen_string_literal: true

require 'web_spec_helper'
require 'json'
require 'base64'

RSpec.describe 'Checkin' do
  it 'can create' do
    Factory[:user, email: 'calin@agilefreaks.com']
    header 'Authorization', "Basic #{Base64.encode64('calin@agilefreaks.com')}"
    post '/today', { data: { type: 'start' } }, 'CONTENT_TYPE': 'application/vnd.api+json'

    expect(response['data']['attributes']['message']).to eq('Uhu!')
  end
end
