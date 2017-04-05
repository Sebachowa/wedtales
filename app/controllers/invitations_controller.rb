class InvitationsController < ApplicationController

  # ------------ Callback ------------
  before_action :find_invitation, only: [:show, :edit, :update]

  # ------------ Skiping AppController Callback ------------
  skip_before_action :authenticate_user!, only: [:index, :show]


  # ------------ CRUD Actions ------------
  def index
    @invitations = Invitation.all
  end

  def show
    @invitation ||= Invitation.find_by(custom_url: params[:id])

    @livetemplate = true

     qrcode = RQRCode::QRCode.new( urlgen )

     @svg = qrcode.as_svg(offset: 0, color: '000',
                   shape_rendering: 'crispEdges',
                   module_size: 11)
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
    @templates = Template.all
    @step = params[:step].to_i
    if @step < 1 || @step > 3
      @step = 1
    end
  end

  def update
    @step = params[:invitation][:step].to_i
    if @invitation.update(invitation_params)
      if @step == 3
        if @invitation.custom_url.present?
          redirect_to custom_url_of_invitation_path(id: @invitation.custom_url)
        else
          redirect_to invitation_path(@invitation)
        end
      else
        redirect_to edit_invitation_path(@invitation, step: @step + 1)
      end
    else
      render :edit
    end
  end

  def choose
    @template = params[:id]
    @invitation = Invitation.create(template_id: @template)
    redirect_to edit_invitation_path(@invitation, step: 2)
  end

  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy
  end

private

  def invitation_params
    params.require(:invitation).permit(:og_title, :og_description, :groom_name, :bride_name, :groom_bio, :bride_bio, :location, :date, :story_title, :wedding_description, :rsvp, :bride_photo, :groom_photo, :template_id, :custom_url, gallery: [])
  end

  def find_invitation
    @invitation = Invitation.find_by(id: params[:id])
  end

  def urlgen
    if find_invitation.custom_url
      path = find_invitation.custom_url
     else
      path = params[:id]
    end

    url = "http://localhost:3000/invitations/" + find_invitation.id.to_s

   end
end
