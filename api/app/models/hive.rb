# frozen_string_literal: true

class Hive < ApplicationRecord
  validates :name, length: { minimum: 6 }, presence: true
end
