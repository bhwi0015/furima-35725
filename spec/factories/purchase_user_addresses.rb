FactoryBot.define do
   factory :purchase_user_address do
      
        token         {"tok_abcdefghijk00000000000000000"}
  
        postal_code   {"123-1234"}
        prefecture_id {2}
        city          {"市"}
        flat_number   {"名1-1"}
        apartment     {"あ"}
        phone_number  {"08021212211"}
      
     end
end
