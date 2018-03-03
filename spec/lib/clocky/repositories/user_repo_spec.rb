# frozen_string_literal: true

require 'db_spec_helper'
require 'clocky/repositories/user_repo'

RSpec.describe Clocky::Repositories::UserRepo do
  let(:repo) { Clocky::Container['repositories.user_repo'] }

  it 'get a user by email' do
    Factory[:user, email: 'calin@agilefreaks.com']
    expect(repo.by_email('calin@agilefreaks.com')).to be_truthy
  end
end