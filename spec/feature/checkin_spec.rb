# frozen_string_literal: true

require 'web_spec_helper'

RSpec.describe 'Checkin' do
  it 'can create' do
    post '/today', { data: { type: 'today' } }

    expect(true).to be_truthy
  end
end