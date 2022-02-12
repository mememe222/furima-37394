class Order
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture, :city, :address, :building, :telephone_number, :record_id, :token

  with_options presence: true do
    validates :user_id, presence: true
    validates :item_id, presence: true
    validates :post_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }
    validates :city, presence: true
    validates :address, presence: true
    validates :telephone_number, presence: true, length: { minimum: 10, maximum: 11 },
                                 format: { with: /\A[0-9]+\z/i, message: 'is invalid. Input half-width characters.' }
    validates :token, presence: true
  end

  def save
    record = Record.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture: prefecture, city: city, address: address, building: building,
                   telephone_number: telephone_number, record_id: record.id)
  end
end
