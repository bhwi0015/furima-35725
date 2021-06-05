FactoryBot.define do

  factory :address do
        postal_code   {"123-1234"}
        prefecture_id {2}
        city          {"市"}
        flat_number   {"名1"}
        phone_number  {"08098765432"}
        
        user
        product 
        purchase_user
   end
  end