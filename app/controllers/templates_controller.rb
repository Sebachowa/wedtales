class TemplatesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def index
    @templates = Template.all
  end

  def show
    @template = Template.find(params[:id])
  end

  def new
    @template = Template.new
  end

  def create
    template_params = params.require(:template).permit(:title, :description, :photo, :stylesheet)
    @template = Template.new(template_params)
    if @template.save
      redirect_to template_path(@template)
    else
      render :new
    end
  end

  def edit
    @template = Template.find(params[:id])
  end

  def update
    template_params = params.require(:template).permit(:title, :description, :photo, :stylesheet)
    @template = Template.find(params[:id])
    @template.update(template_params)
    redirect_to template_path(@template)
  end

  def destroy
    @template = Template.find(params[:id])
    @template.destroy
    redirect_to templates_path
  end
end
