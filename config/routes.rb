# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  resources 'about', only: :index
  resources 'contact', only: :index
  resources 'items', only: %i[index show]
end
