class PagesController < ApplicationController

  # ------------ Skiping AppController Callback ------------
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @templates = Template.all
  end

  def dashboard
  end

  def invitation_guest_list
    invitation = Invitation.find params[:invitation_id]
    @guests = invitation.guests
  end

  def invitation_delete_link
    invitation = Invitation.find params[:invitation_id]
    @invitation = invitation
  end

  def invitation_share_link
    invitation = Invitation.find params[:invitation_id]
    if invitation.custom_url.present?
      @share_link = "http://localhost:3000/#{invitation.custom_url}"
    else
      @share_link = "http://localhost:3000/invitations/#{invitation.id}"
    end
  end
end
