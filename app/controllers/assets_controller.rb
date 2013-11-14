class AssetsController < ApplicationController
  def destroy
    Asset.destroy(params[:id])
    render nothing: true 
  end

  def update
    @item = Item.find(params[:item_id])
    @item.assets.where(main:true).update_all(main:false)
    Asset.find(params[:id]).update_attribute(:main,true)
    render :partial => "items/item_assets"
  end
end
