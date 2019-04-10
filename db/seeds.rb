# frozen_string_literal: true

1.upto(10) do |i|
  Item.create!(
    original_price: rand(1..99).decimal(2)
  )
  p "ITEM #{i} : créé"
end
