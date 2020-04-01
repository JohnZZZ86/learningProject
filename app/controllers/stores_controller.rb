class StoresController < ApplicationController
  def index

  end

  def show
    all_items = {}
    all_items['store'] = Store.distinct.pluck(:name)
    all_items['items'] = Item.distinct.pluck(:name)
    all_items['color'] = Item.distinct.pluck(:color)
    all_items['size'] = Item.distinct.pluck(:size)

    @condition = {}
    if params[:store].present?
      @selected_store = Store.distinct.where(name: params[:store]).pluck(:id)
      @items_selected_store = StoreItem.where(store_id: @selected_store).pluck(:item_id)
    end
    if params[:item_name].present?
      @condition['name'] = params[:item_name]
    end
    if params[:item_color].present?
      @condition['color'] = params[:item_color]
    end
    items_result = {}
    items_result['items'] = Item.distinct.where(@condition, id: @items_selected_store).pluck(:name)
    items_result['color'] = Item.distinct.where(@condition, id: @items_selected_store).pluck(:color)
    items_result['size'] = Item.distinct.where(@condition, id: @items_selected_store).pluck(:size)

    selected_item = Item.where(name: params[:item_name], size: params[:item_size], color: params[:item_color]).pluck(:id)
    quantity_current_item = StoreItem.where(:store_id => @selected_store, :item_id => selected_item).pluck(:quantity)

    if request.xhr?
      respond_to do |format|
        format.json do
          render json: { items_result: items_result, all_items: all_items, quantity_current_store: quantity_current_item }
        end
      end
    end
  end

  private

  def store_params
    params.require(:store).permit(:store, :store_id)
  end
end
