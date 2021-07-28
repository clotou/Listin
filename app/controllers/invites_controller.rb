class InvitesController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @invites = current_user.invites
    @pending_invites = @invites.select { |invite| invite.accepted != true}.uniq
    @accepted_invites = @invites.select { |invite| invite.accepted == true }.uniq
  end

  def new
    @invite = Invite.new
    @list = List.find(params[:list_id])
  end

  def create
    @invite = Invite.new(invite_params)
    @list = List.find(params[:list_id])
    @invite.list = @list
    #Getting email from form
    email = params[:invite][:email]
    #Getting user from email submitted by the user
    user = User.find_by(email: email)
    if user
      @invite.user = user
    end
    if @invite.save
      flash.notice = "#{@invite.user.first_name} has been invited to #{@invite.list.name}"
    else
      flash.alert = "#{email} doesn't have a ListIn account yet."

    end
    redirect_to list_path(@list.id)
  end

  def accept
    # raise
    @invite = Invite.find(params[:id])
    @invite.accepted = true
    if @invite.save
      flash.notice = "You successfully joined #{@invite.list.name}"
      redirect_to list_path(@invite.list)
    end
  end

  private

  def invite_params
    params.require(:invite).permit(:list_id)
  end
end
