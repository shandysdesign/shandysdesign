# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    sequence(:name) { |i| "Item #{i + 1}" }
    description { 'The item description blah blah' }
    price { 100.50 }
    status { 'available' }
  end
end
