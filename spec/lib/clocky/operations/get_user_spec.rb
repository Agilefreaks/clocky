# frozen_string_literal: true

require 'spec_helper'
require 'dry/container/stub'
require 'clocky/domain/user'

RSpec.describe Clocky::Operations::GetUser do
  let(:repo) { instance_double(Clocky::Repositories::UserRepo) }
  let(:get_user) { Clocky::Operations::GetUser.new(user_repo: repo) }

  it 'will return the user when it finds one' do
    user = Clocky::User.new(email: 'doru@haterul.com')
    allow(repo).to receive(:by_email).with('doru@haterul.com').and_return(user)

    expect(get_user.('doru@haterul.com').value!).to be(user)
  end

  it 'will fail when it does not find a user' do
    allow(repo).to receive(:by_email).with('doru@haterul.com').and_return(nil)

    expect(get_user.('doru@haterul.com').failure).to be_truthy
  end
end