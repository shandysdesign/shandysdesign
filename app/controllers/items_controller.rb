class ItemsController < ApplicationController

  before_filter :authenticate_user, :only => [:new, :edit, :create, :update]
  before_filter :find_item, :only => [:show, :edit, :update]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params) 
    redirect_to @item
  end
  
  def edit
  end

  def show
  end

  def update
    @item.update_attributes(item_params)
    redirect_to items_path
  end


  private

  def item_params
    params.require(:item).permit(:name,:price,:description,:status,:assets_attributes=>[:image])
  end

  def authenticate_user
    redirect_to root_path unless user_signed_in?
  end

  def find_item
    @item = Item.find(params[:id]) rescue nil
    redirect_to items_path unless @item
  end

end
