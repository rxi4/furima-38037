class UserAddress < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1 }

  #def save
    #buy = Buy.create(user_id: user_id, item_id: item_id)
    #Destination.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, buy_id: buy.id)
  #end
end
