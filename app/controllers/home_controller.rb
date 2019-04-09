# frozen_string_literal: true

class HomeController < ApplicationController
  def landing_page
    @items = Item.all
  end
end
