

class School < ActiveRecord::Base

	validates :school_name, presence:true, length: {minimum:5}
	validates :school_description, presence:true
	validates :school_address, presence:true
	validates :location, presence: true
	validates_uniqueness_of :school_name, scope: [:location, :category, :classification, :school_address], :message => "%{value}, with the same address, location and category has already been taken" #better than using .exists? and works on update method, basically checks that a record wwith the same school name, category, and location doesn't appear twice
	mount_uploader :picture, PictureUploader
	#validates :category, presence:true


	searchkick word_start: [:school_name]

	CATEGORIES = ["Primary", "Secondary", "Primary&Secondary", "Creche", "University"]
	CLASSIFICATION = ["Federal", "State", "Private"]
	STATES = ["Abia", "Lagos", "Fct", "Adamawa", "Benue", "Borno"]

	geocoded_by :address
	after_validation :geocode

	def address
		[school_address, location].compact.join(',') #.compact removes nil arguments/ members from the array
	end

	

end



