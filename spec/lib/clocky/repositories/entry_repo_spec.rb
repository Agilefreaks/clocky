# frozen_string_literal: true

require 'db_spec_helper'
require 'clocky/repositories/entry_repo'

RSpec.describe Clocky::Repositories::EntryRepo do
  let(:repo) { Clocky::Container['repositories.entry_repo'] }

  describe :for_today_by_type_and_user do
    it 'will return entry if the user has an entry in the same day with the same type' do
      entry = Factory[:entry]

      expect(repo.for_today_by_type_and_user(entry.user_id, entry.type)).not_to be_nil
    end

    it 'will return nil if the user has no entry with the same type' do
      entry = Factory[:entry, type: 'start']

      expect(repo.for_today_by_type_and_user(entry.user_id, 'stop')).to be_nil
    end

    it 'will return nil if the use has the same time some other day' do
      entry = Factory[:entry, type: 'start', created_at: (Date.today - 1).to_time.utc]

      expect(repo.for_today_by_type_and_user(entry.user_id, 'start')).to be_nil
    end
  end

  describe :for_today do
    it 'will return all entries for today' do
      Factory[:entry, user: Factory[:user, email: 'geo@bogza.com']]

      expect(repo.for_today.first.user.email).to eq('geo@bogza.com')
    end
  end
end
