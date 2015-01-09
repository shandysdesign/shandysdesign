module ItemsHelper
  def item_price(item)
    if item.available?
      number_to_currency(item.price)
    else
      number_to_currency(item.price)+" (#{item.status.upcase})"
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
