require 'will_paginate/array'
class SchoolsController < ApplicationController
  def new
  	@school = School.new
  end

  def edit
  end

  def show
     @school = School.find_by(id: params[:id])
  end

  def index
  	if params[:query].present?
      @schools = School.search(params[:query],page: params[:page], per_page: 10, fields: [{school_name: :word_start }, {school_address: :word_start},{location: :word}])
    else
      @schools = []
    end
  end

  def create
  	@school = School.new(school_params)

  	if @school.save
  		flash[:success] = "School saved successfully"
  		redirect_to root_url
  	else
  		render 'new'
  	end
  end

  def all
    @schools = School.all.paginate(page: params[:page])
  end

  private

  def school_params
  	params.require(:school).permit(:school_name, :school_description, :school_address, :school_image, :location)
  end
end
