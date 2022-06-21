class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_cost
  belongs_to :shipping_date
  has_one_attached :image

  belongs_to :user
  has_one :buy

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
    validates :category_id
    validates :item_status_id
    validates :shipping_cost_id
    validates :shipping_date_id
  end

  with_options presence: true do
    validates :user
    validates :name
    validates :price
    validates :description
    validates :category_id
    validates :item_status_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :image
  end
end

