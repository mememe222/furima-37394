class Order < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :prefecture, :city, :address, :building, :telephone_number, :record_id


  with_options presence: true do
    validates :user_id, presence: true
    validates :item_id, presence: true
    validates :post_code, presence: true
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :city, presence: true
    validates :address, presence: true
    validates :building
    validates :telephone_number, presence: true
    validates :record, presence: true
  end

  def save
    record = record.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture: prefecture, city: city, address: address, building: building, telephone_number: telephone_number, record_id: record.id)
  end
end
