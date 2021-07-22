class ItemsController < ApplicationController
  def new
    @item = Item.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @list = List.find(params[:list_id])
    @item.list_id = @list.id
    if @item.save
      flash.notice = "#{@item.title} has been added to your list"
      redirect_to list_path(@list.id)
    else
      render :new
    end
  end

  def asdone
    @item = Item.find(params[:id])
    @item.done = true
    if @item.save
      flash.notice = "#{@item.title} has been add to you basket."
      redirect_to list_path(@item.list)
    end
  end

  def destroy
    @item = Item.find(params[:list_id])
    # @item.user_id = current_user.id
    @item.destroy
    flash.notice = "#{@item.title} has been removed."
    redirect_to list_path(@item.list)
  end

  private

  def item_params
    params.require(:item).permit(:list_id, :user_id, :status, :title, :quantity)
  end
end

