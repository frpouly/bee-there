# frozen_string_literal: true

class Hive < ApplicationRecord
  validates :name, length: { minimum: 6 }, presence: true
  validates :weight, numericality: { greater_than: 0 }
end
