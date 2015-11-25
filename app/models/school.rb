
class School < ActiveRecord::Base

	validates :school_name, presence:true, length: {minimum:5}
	validates :school_description, presence:true
	validates :school_address, presence:true
	validates :location, presence: true
	mount_uploader :picture, PictureUploader
	#validates :category, presence:true


	searchkick word_start: [:school_name]

	CATEGORIES = ["Federal", "State", "Private"]

end



