class InvitationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @invitations = Invitation.all
  end

  def show
    @livetemplate = true
    @invitation = Invitation.find(params[:id])
    @invitation = Invitation.find(params[:id])
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
      puts @invitation.errors.messages
      render :new
    end
  end

  def edit
    @invitation = Invitation.find(params[:id])
    @step = params[:step].to_i
    if @step < 1 || @step > 3
      @step = 1
    end
  end

  def update
    @invitation = Invitation.find(params[:id])
    @step = params[:invitation][:step].to_i
    if @invitation.update(invitation_params)
      if @step == 3
        redirect_to invitation_path(@invitation)
      else
        redirect_to edit_invitation_path(@invitation, step: @step + 1)
      end
    else
      puts @invitation.errors.messages
      render :edit
    end
  end

  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy
    # redirect_to dashboard_path
  end

  def invitation_params
    params.require(:invitation).permit(:og_title, :og_description, :groom_name, :bride_name, :groom_bio, :bride_bio, :location, :date, :story_title, :wedding_description, :rsvp, :bride_photo, :groom_photo, :template_id, :custom_url, gallery: [])
  end
end
