class ItemsController < ApplicationController
  before_action :setup_fake_flash

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
      @flash[:notice] = "#{@item.name} was saved"
    else
      @flash[:notice] = "Error: Item was not saved"
    end

    respond_to do |format|
			format.html
      format.js
		end

  end

  def destroy
    @user = User.find(params[:user_id])
    @item = @user.items.find(params[:id])

    if @item.destroy
      @flash[:notice] = "#{@item.name} has been deleted"
    else
      @flash[:notice] = "Item couldn't be deleted"
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def setup_fake_flash
    @flash = {}
  end

  def item_params
    params.require(:item).permit(:name)
  end
end
