class InvitationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @invitations = Invitation.all
  end

  def show
    @invitation = Invitation.find(params[:id])
    @guest = Guest.new
  end

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.user_id = current_user.id
    if @invitation.save
      redirect_to invitation_path(@invitation)
    else
      render :new
    end
  end

  def edit
    @invitation = Invitation.find(params[:id])
  end

  def update
    @invitation = Invitation.find(params[:id])
    @invitation.update(invitation_params)
    redirect_to invitation_path(@invitation)
  end

  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy
    # redirect_to dashboard_path
  end

  def invitation_params
    params.require(:invitation).permit(:og_title, :og_description, :groom_name, :bride_name, :groom_bio, :bride_bio, :location, :date, :wedding_description, :rsvp, photos: [])
  end
end
