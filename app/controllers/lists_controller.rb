class ListsController < ApplicationController
  def index
    @all_lists = List.all
    @lists_invitations = current_user.invites.select {|invite| invite.accepted?}
    @all_user_lists = @all_lists.select {|list| list.user_id == current_user.id || !trip.invites.select { |invite| invite.accepted? && invite.user_id == current_user.id }.empty? }
    @lists = @all_user_lists.uniq.sort
  end

  def show
    @list = List.find(params[:id])
    @invite = Invite.new
    @item = Item.new
    @items = @list.items
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    if @list.save
      flash.notice = "#{@list.title} has been created"
      redirect_to list_path(@list.id)
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.user_id = current_user.id
    @list.delete
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
