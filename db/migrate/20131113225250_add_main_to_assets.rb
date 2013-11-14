class AddMainToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :main, :boolean
  end
end
