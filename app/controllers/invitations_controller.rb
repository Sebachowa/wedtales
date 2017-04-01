class InvitationsController < ApplicationController

  # ------------ Callback ------------
  before_action :find_invitation, only: [:show, :edit, :update, :destroy]

  # ------------ Skiping AppController Callback ------------
  skip_before_action :authenticate_user!, only: [:index, :show]

  # ------------ CRUD Actions ------------
  def index
    @invitations = Invitation.all
  end

  def show
    @livetemplate = true
  end

  def new
    @templates = Template.all
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.user_id = current_user.id
    if @invitation.save
      redirect_to edit_invitation_path(@invitation, step:2)
    else
      render :new
    end
  end

  def edit
    @step = params[:step].to_i
    if @step < 1 || @step > 3
      @step = 1
    end
  end

  def update
    @step = params[:invitation][:step].to_i
    if @invitation.update(invitation_params)
      if @step == 3
        redirect_to invitation_path(@invitation)
      else
        redirect_to edit_invitation_path(@invitation, step: @step + 1)
      end
    else
      render :edit
    end
  end

  def destroy
    @invitation.destroy
    redirect_to dashboard_path
  end

private

  def invitation_params
    params.require(:invitation).permit(:og_title, :og_description, :groom_name, :bride_name, :groom_bio, :bride_bio, :location, :date, :story_title, :wedding_description, :rsvp, :bride_photo, :groom_photo, :template_id, :custom_url, gallery: [])
  end

  def find_invitation
    @invitation = Invitation.find(params[:id])
  end
end
