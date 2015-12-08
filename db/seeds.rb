School.create!(school_name: "kachi", school_address: "somewhere", school_description: "stuff", location: "yaba", category:"Secondary", classification:"Federal", approved:true)

#seed the schools table with randomly generated data using the faker gem
50.times do |n|
	name = Faker::University.name
	address = ["sabo", "egbeda"].sample
	school_location = "lagos"
	description = Faker::Lorem.sentence(10)
	website = Faker::Internet.url('schools.com')
	classifications = ["Federal", "State", "Private"].sample
	categories = ["Primary", "Secondary", "Primary&Secondary", "Creche", "University"].sample

	School.create!(school_name: name, school_address: address, school_description: description, location: school_location, website: website, category:"private", classification: classifications, category: categories, approved:false)
end


#seed the users table with data
1.times do |n|
	User.create!(name: "kachi", email:"robocopkaka@gmail.com", password:"robocop", password_confirmation:"robocop", admin:true)
end