class Item < ActiveRecord::Base
  has_many :assets
  accepts_nested_attributes_for :assets
  after_create :set_main_asset

  def set_main_asset
    self.assets.first.update_attribute(:main,true)
  end
end

