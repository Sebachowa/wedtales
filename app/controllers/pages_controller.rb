class PagesController < ApplicationController

  # ------------ Skiping AppController Callback ------------
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
  end

  def invitation_guest_list
    invitation = Invitation.find params[:invitation_id]
    @guests = invitation.guests
  end
end
