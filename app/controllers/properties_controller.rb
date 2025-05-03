class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
    @city      = params[:city]

    @properties = if @city.present?
    Property.where(city: @city)
    else
    Property.none
    end

    render :search
  end
end
