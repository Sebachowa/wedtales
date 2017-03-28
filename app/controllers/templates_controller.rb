class TemplatesController < ApplicationController

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
    template_params = params.require(:template).permit(:title, :description)
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
    @template = Task.find(params[:id])
    @template.update(title: params[:title], description: params[:description])
    redirect_to template_path(@template)

  end

  def destroy
    @template = Template.find(params[:id])
    @template.destroy
    redirect_to templates_path
  end
end
