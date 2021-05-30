FactoryBot.define do
  factory :product do

    product_name       {"あaaaaa"}
    description        {"あaaaaaa"}
    category_id       {"2"}
    status_id         {"2"}
    shipping_id       {"2"}
    prefecture_id     {"2"}
    send_day_id       {"2"}
    price             {"500"}
    user
  end
end
