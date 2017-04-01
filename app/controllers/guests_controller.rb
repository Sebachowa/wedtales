class GuestsController < ApplicationController

  # ------------ Callback ------------
  before_action :find_guest, only: [:show, :edit, :update, :destroy]
  before_action :find_invitation, only: [:index, :new, :create]

  # ------------ Skiping AppController Callback ------------
  skip_before_action :authenticate_user!, only: [:index]

  # ------------ CRUD Actions ------------
  def index
    @guests = @invitation.guests
  end

  def show
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = @invitation.guests.new(guest_params)
    if @guest.save
      redirect_to invitation_path(@invitation)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @guest.update(full_name: params[:full_name], email: params[:email], phone_number: params[:phone_number], plus: params[:plus])
    redirect_to guest_path(@guest)
  end

  def destroy
    @guest.destroy
    redirect_to guests_path
  end

  private

  def guest_params
    params.require(:guest).permit(:full_name, :email, :phone_number, :plus, :invitation_id)
  end

  def find_guest
    @guest = Guerst.find(params[:id])
  end

  def find_invitation
    @invitation = Invitation.find(params[:invitation_id])
  end
end
