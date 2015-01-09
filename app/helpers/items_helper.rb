module ItemsHelper
  def item_price(item)
    if item.sold?
      number_to_currency(item.price)+" (SOLD)"
    else
      number_to_currency(item.price)
    end
  end

  def main_item(item)
    if item.main_asset.present?
      item.main_asset.image.url(:medium)
    else
      item.assets.first.image.url(:medium)
    end
  end
end
