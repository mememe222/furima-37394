class Record < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipment_source
end
