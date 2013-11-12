class Asset < ActiveRecord::Base
  belongs_to :item
  has_attached_file :image,
                    :styles => { :medium => ["300x300>", :png] },
                    :convert_options => {:medium => Proc.new{self.convert_options}}

  def self.convert_options(px = 15)
    trans = ""
    trans << " \\( +clone  -alpha extract "
    trans << "-draw 'fill black polygon 0,0 0,#{px} #{px},0 fill white circle #{px},#{px} #{px},0' "
    trans << "\\( +clone -flip \\) -compose Multiply -composite "
    trans << "\\( +clone -flop \\) -compose Multiply -composite "
    trans << "\\) -alpha off -compose CopyOpacity -composite "
  end
end
