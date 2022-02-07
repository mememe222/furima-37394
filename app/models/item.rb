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
  validates :image, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :shipment_source_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :shipping_days_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :price, presence: true
end

