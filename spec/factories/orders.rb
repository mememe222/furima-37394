FactoryBot.define do
  factory :order do
    token                 { 'tok_abcdefghijk00000000000000000' }
    post_code             { '123-4567' }
    prefecture            { 2 }
    city                  { 'さいたま市' }
    address               { '大宮区' }
    building              { 'aaa' }
    telephone_number      { '08012345678' }
  end
end
