class GuestsController < ApplicationController

  def index
    @guests = Guest.all
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def new
    @guest = Guest.new
  end

  def create
    guest_params = params.require(:guest).permit(:full_name, :email, :phone_number, :plus)
    @guest = Guest.new(guest_params)
    if @guest.save
      redirect_to guest_path(@guest)
    else
      render :new
    end
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def update
    @guest = Guest.find(params[:id])
    @guest.update(full_name: params[:full_name], email: params[:email], phone_number: params[:phone_number], plus: params[:plus])
    redirect_to guest_path(@guest)
  end

  def destroy
    @guest = Guerst.find(params[:id])
    @guest.destroy
    redirect_to guests_path
  end
end
