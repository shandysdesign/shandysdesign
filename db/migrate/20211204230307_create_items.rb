# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string   :name
      t.text     :description
      t.decimal  :price, precision: 8, scale: 2
      t.string   :status

      t.timestamps
    end
  end
end
