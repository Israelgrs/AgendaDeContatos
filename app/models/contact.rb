# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :kind
  has_one :address

  accepts_nested_attributes_for :address, allow_destroy: true
end
