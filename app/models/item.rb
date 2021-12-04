# frozen_string_literal: true

class Item < ApplicationRecord
  has_many_attached :photos

  scope :active, -> { where.not(status: 'removed') }

  enum status: {
    available: 'available',
    reserved: 'reserved',
    sold: 'sold',
    removed: 'removed'
  }

  def main_asset
    assets.where(main: true).first
  end
end
