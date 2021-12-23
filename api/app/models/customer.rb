# frozen_string_literal: true

class Customer < ApplicationRecord
  validates :cpf, presence: true, uniqueness: true
end
