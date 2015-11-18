
class School < ActiveRecord::Base

	validates :school_name, presence:true
	validates :school_description, presence:true
	validates :school_address, presence:true
	#validates :category, presence:true


	searchkick word_start: [:school_name]

	CATEGORIES = ["Federal", "State", "Private"]

end



