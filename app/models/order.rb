class Order
  include ActiveModel::Model
  attr_accessor :user_id, :item_id,:post_code, :prefecture, :city, :address, :building, :telephone_number, :record_id


  with_options presence: true do
    validates :user_id, presence: true
    validates :item_id, presence: true
    validates :post_code, presence: true
    validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }
    validates :city, presence: true
    validates :address, presence: true
    validates :telephone_number, presence: true
  end

  def save
    record = Record.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture: prefecture, city: city, address: address, building: building, telephone_number: telephone_number, record_id: record.id)
  end
end
