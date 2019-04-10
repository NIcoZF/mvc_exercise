# frozen_string_literal: true

1.upto(10) do |i|
  Item.create!(
    original_price: Faker::Number.within(1..99)
  )
  p "ITEM #{i} : créé"
end
