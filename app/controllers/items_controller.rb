class ItemsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @item = Item.new
  end

  def create
    @user = User.find(params[:user_id])
    @items = @user.items

    @item = current_user.items.build( item_params )
    # @item.user = @user
    @new_item = Item.new

    if @item.save
      flash[:notice] = "Item was saved"
    else
      flash[:notice] = "Error: Item was not saved"
    end

    respond_to do |format|
			format.html
      format.js
		end

  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
