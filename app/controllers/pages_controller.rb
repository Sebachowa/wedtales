class PagesController < ApplicationController

  # ------------ Skiping AppController Callback ------------
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @guests = Guest.all
  end

  def invitation_guest_list
    @guests = Guest.all
  end
end
