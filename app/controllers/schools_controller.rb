require 'will_paginate/array'
class SchoolsController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  def new
  	@school = School.new
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

  def edit
    @school = School.find_by(id: params[:id])
  end

  def update
    @school = School.find_by(id: params[:id])
    if @school.update_attributes(school_params)
      flash[:success] = "School edited successfully"
      @school.update_attributes(approved: false)
      redirect_to @school
    else
      render 'edit'
    end
  end

  def show
     @school = School.find_by(id: params[:id])
  end

  def index
  	if params[:query].present?
     #@schools = School.search(params[:query],page: params[:page], per_page: 10, fields: [{school_name: :word_start }, {school_address: :word_start},{location: :word}])
    @schools = School.near(params[:query], 100) #the second option will be the distance in miles. You can  change the dafault to km. Find out later
    else
      #@schools = []
      @schools = School.search(params[:query],page: params[:page], per_page: 10, fields: [{school_name: :word_start }, {school_address: :word_start},{location: :word}])

    end
  end


  def all
    @schools = School.all.paginate(page: params[:page], per_page:10)
  end

  # this action pulls all the federal schools from the schools table
  def federal_schools
   @schools = School.where(category: "Federal").paginate(page: params[:page], per_page:10)
  end

  # this action pulls all the private schools from the schools table
  def private_schools
    @schools = School.where(category: "private").paginate(page: params[:page], per_page:10)
  end

  def state_schools
    @schools = School.where(category: "state").paginate(page: params[:page], per_page:10)
  end


  private

  def school_params
  	params.require(:school).permit(:school_name, :school_description, :school_address, :school_image, :location, :category,:website, :picture)
  end
end
