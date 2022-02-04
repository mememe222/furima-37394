class Item < ApplicationRecord
  belongs_to :user
  has_one :record
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipment_source
  belongs_to :days
  belongs_to :charge

  validates :title, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :condition_id, presence: true
  validates :shipment_source_id, presence: true
  validates :shipping_days_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :price, presence: true
end

