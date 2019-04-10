# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @items = Item.all
    @item = Item.find(params[:id])
  end
end
