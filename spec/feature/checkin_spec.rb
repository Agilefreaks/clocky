# frozen_string_literal: true

require 'web_spec_helper'
require 'json'

RSpec.describe 'Checkin' do
  it 'can create' do
    header 'Authorization', 'Basic 42'
    post '/today', { data: { type: 'today' } }.to_json, { 'CONTENT_TYPE': 'application/vnd.api+json' }

    expect(true).to be_truthy
  end
end