class GuestsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @invitation = Invitation.find(params[:invitation_id])
    @guests = @invitation.guests
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def new
    @invitation = Invitation.find(params[:invitation_id])
    @guest = Guest.new
  end

  def create
    guest_params = params.require(:guest).permit(:full_name, :email, :phone_number, :plus, :invitation_id)
    @invitation = Invitation.find(params[:invitation_id])
    @guest = @invitation.guests.new(guest_params)
    if @guest.save
      redirect_to invitation_path(@invitation)
    else
      render :new
    end
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def update
    @guest = Guest.find(params[:id])
    @guest.update(full_name: params[:full_name], email: params[:email], phone_number: params[:phone_number], plus: params[:plus])
    redirect_to guest_path(@guest)
  end

  def destroy
    @guest = Guerst.find(params[:id])
    @guest.destroy
    redirect_to guests_path
  end
end
