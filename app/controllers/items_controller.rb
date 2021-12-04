# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.active
  end

  def show
    @item = Item.find_by(id: params[:id])
    redirect_to items_path if @item.nil?
  end
end
