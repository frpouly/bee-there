# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Hive do
  describe 'validation' do
    it 'can not create a hive the name is missing' do
      expect { described_class.create!({ weight: 12 }) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'can not create a hive when the name length is < 6' do
      expect do
        described_class.create!({ name: 'short', weight: 12 })
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'can create a hive with valid attributes' do
      expect do
        described_class.create!({ name: 'not_short', weight: 12 })
      end.not_to raise_error
    end
  end
end
