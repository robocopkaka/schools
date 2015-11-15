School.create!(school_name: "kachi", school_address: "somewhere", school_description: "stuff", location: "yaba")

#seed the schools table with randomly generated data using the faker gem
50.times do |n|
	name = Faker::University.name
	address = Faker::Address.street_address
	school_location = Faker::Address.state
	description = Faker::Lorem.sentence(1)

	School.create!(school_name: name, school_address: address, school_description: description, location: school_location)
end


#seed the users table with data
1.times do |n|
	User.create!(name: "kachi", email:"robocopkaka@gmail.com", password:"robocop", password_confirmation:"robocop")
end