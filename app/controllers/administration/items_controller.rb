# frozen_string_literal: true

module Administration
  class ItemsController < AdministrationController
    def index
      @emails = User.emails_of_all_users
      @items = Item.all
    end

    def update
      @item = Item.find(params[:id])

      if params[:item][:discount_percentage] == "0"
        @item.update(has_discount: false, discount_percentage: [:item][:discount_percentage])
      else
        @item.update(has_discount: true, discount_percentage: [:item][:discount_percentage])
      end
      redirect_to administration_items_path
    end
  end
end
