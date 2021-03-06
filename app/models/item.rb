# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id                  :bigint(8)        not null, primary key
#  original_price      :float            not null
#  has_discount        :boolean          default(FALSE)
#  discount_percentage :integer          default(0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Item < ApplicationRecord
  validates :discount_percentage,
            inclusion: { in: 0..99 },
            numericality: { only_integer: true }

  def price
    if has_discount == true
      (original_price - (original_price * discount_percentage / 100)).round(2)
    else
      original_price
    end
  end

  def self.average_price
    price_array = []
    all.find_each do |item|
      price_array << item.price
    end
    (price_array.sum / price_array.count).round(1)
  end
end
