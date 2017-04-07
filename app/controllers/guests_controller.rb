class GuestsController < ApplicationController

  # ------------ Callback ------------
  before_action :find_guest, only: [:show, :edit, :update, :destroy]
  before_action :find_invitation, only: [:index, :new, :create]

  # ------------ Skiping AppController Callback ------------
  skip_before_action :authenticate_user!

  # ------------ CRUD Actions ------------
  def index
    @guests = @invitation.guests
  end

  def show
  end

  def new
    @livetemplate = true
    @guest = Guest.new
  end

  def create
    @livetemplate = true
    @guest = @invitation.guests.new(guest_params)
    if @guest.save
      # redirect_to "/#{@invitation.custom_url}?rsvp=success&guest=#{@guest.id}"
      redirect_to custom_url_of_invitation_path(@invitation, rsvp: 'success', guest: @guest.id)
    else
      # render :new
      # redirect_to "/#{@invitation.custom_url}?rsvp=fail"
      redirect_to custom_url_of_invitation_path(@invitation, rsvp: 'fail')
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
