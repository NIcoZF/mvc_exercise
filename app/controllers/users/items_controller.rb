# frozen_string_literal: true

class Users::ItemsController < ApplicationController
  def index
    @items = Item.all
  end
end
