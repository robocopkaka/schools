require 'will_paginate/array'
class SchoolsController < ApplicationController
  before_action :admin_user, only: [:destroy]
  def new
  	@school = School.new
  end

    def create
    @school = School.new(school_params)

    if @school.save
      flash[:success] = "School saved successfully"
      redirect_to school_path(@school)
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

  # display pages for schools and for getting schools of the same category that are within 10 miles of the school
  def show
     @school = School.find_by(id: params[:id])
     @schools = School.near([@school.latitude,@school.longitude], 10).where("id != ? AND category = ?", @school.id, @school.category).limit(4)
  end

  def schools_near_you
    @lat_lng = cookies[:lat_lng].split("|")
    @schools = School.near(@lat_lng, 10) #the second option will be the distance in miles. You can  change the dafault to km. Find out later
  end

  #This action currently shows a search field on the index view
  def index
  	if params[:query].present?
     @schools = School.search(params[:query],page: params[:page], per_page: 10, fields: [{school_name: :word_start }, {school_address: :word_start},{location: :word}])
    else
      @schools = []
    end
  end

  def states
    @client =  GooglePlaces::Client.new("AIzaSyADkLxPNSIpS_rAn1T54kUOxBQNla7la9k")
    @states = @client.spots(6.507593,3.3690259, :types => 'states')
  end

   def destroy
    School.find(params[:id]).destroy
    flash[:success] = "School deleted successfully"
    redirect_back_or(admin_url)
  end

  # This action returns all approved schools from the database
  def all
    @schools = School.all.where("approved == ?", true).paginate(page: params[:page], per_page:10)
  end

  # this action pulls all the federal schools from the schools table
  def federal_schools
    @lat_lng = cookies[:lat_lng].split("|")
   @schools = School.near(@lat_lng, 10).where(classification: "Federal").paginate(page: params[:page], per_page:10) # to find federal schools near you
  end


  # this action pulls all the private schools from the schools table
  def private_schools
    @lat_lng = cookies[:lat_lng].split("|")
    @schools = School.near(@lat_lng, 10).where(classification: "Private").paginate(page: params[:page], per_page:10)
  end

  def state_schools
    @schools = School.where(classification: "State").paginate(page: params[:page], per_page:10)
  end

  def primary_schools
    @schools = School.where(category: "Primary").paginate(page: params[:page], per_page:10)
  end

  def secondary_schools
    @schools = School.where(category: "Secondary").paginate(page: params[:page], per_page:10)
  end

  def primary_and_secondary_schools
    @schools = School.where(category: "Primary&Secondary").paginate(page: params[:page], per_page:10)
  end

  def creches
    @schools = School.where(category: "Creche").paginate(page: params[:page], per_page:10)
  end

  def universities
    @schools = School.where(category: "University").paginate(page: params[:page], per_page:10)
  end   

  private

  def school_params
  	params.require(:school).permit(:school_name, :school_description, :school_address, :school_image, :location, :category,:website, :picture, :classification)
  end

   def admin_user
      redirect_to(root_url) unless current_user.admin?    
    end
end
