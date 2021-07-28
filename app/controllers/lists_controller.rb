class ListsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    # @all_lists = List.all
    # @lists_invitations = current_user.invites.select {|invite| invite.accepted?}
    # @all_user_lists = @all_lists.select { |list| list.user_id == current_user.id || !list.invites.select { |invite| invite.accepted? && list.user_id == current_user.id}.empty? }
    # @lists = @all_user_lists.uniq.sort
    @lists_invitations = current_user.invites.select { |invite| invite.accepted?}.map {|invite| invite.list}.uniq.sort {|a,b| b.created_at <=> a.created_at}
    @lists = current_user.lists.uniq.sort {|a,b| b.created_at <=> a.created_at}

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
      flash.notice = "#{@list.name} has been created"
      redirect_to list_path(@list.id)
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.user_id = current_user.id
    @list.destroy
    flash.notice = "#{@list.name} has been removed."
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end

