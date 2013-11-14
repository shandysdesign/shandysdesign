module ItemsHelper
  def main_item(item)
    if item.main_asset.present?
      item.main_asset.image.url(:medium)
    else
      item.assets.first.image.url(:medium)
    end
  end
end
