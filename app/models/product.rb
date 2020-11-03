class Product < ApplicationRecord
  validates :category, :style, :name, :description, :image, :colour, :price, presence: true
  has_many :units, dependent: :destroy

  def self.filter_by_property(category = nil, style = nil, colour = nil)
    return where(category: category, style: style, colour: colour) if category && style && colour
    return where(category: category, style: style) if category && style
    return where(category: category, colour: colour) if category && colour
    return where(colour: colour, style: style) if colour && style
    return where(category: category) if category
    return where(style: style) if style
    return where(colour: colour) if colour

    all
  end

end
