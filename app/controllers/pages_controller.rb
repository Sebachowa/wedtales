class PagesController < ApplicationController

  # ------------ Skiping AppController Callback ------------
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @templates = Template.all
  end

  def dashboard
  end

  def preview
    invitation = Invitation.find params[:invitation_id]
    if invitation.custom_url.present?
      @invitation_url = "http://localhost:3000/#{invitation.custom_url}"
    else
      @invitation_url = "http://localhost:3000/invitations/#{invitation.id}"
    end
    qrcode = RQRCode::QRCode.new( @invitation_url )

    @svg = qrcode.as_svg(offset: 0, color: '000',
                   shape_rendering: 'crispEdges',
                   module_size: 3)
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
      @share_link = "https://wedtales.herokuapp.com/#{invitation.custom_url}"
    else
      @share_link = "https://wedtales.herokuapp.com/invitations/#{invitation.id}"
    end
    qrcode = RQRCode::QRCode.new( @share_link )

    @svg = qrcode.as_svg(offset: 0, color: '000',
                   shape_rendering: 'crispEdges',
                   module_size: 3)
    return
      @share_link
  end
end
