# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users_list = [
	[1, 'Raggedtoothguppie', 'raggestoothguppie@yahoo.com', '$2a$10$yRDwB73Q4EVIdqGL0vkktuYGEzj6A7ntTSV6t7DB7A304dQ9oWzGK', 'Claire', 'Brown'],
	[2, 'Hybridspyda', 'hybridspyda@gmail.com', '$2a$10$IWberCJnQaY8O1oZHQ1Ht.DhSGWqTwzDsUag/pRyqfoNKkMEV2wEi', 'Matthew', 'Davis']
]
User.destroy_all
users_list.each do |id, username, email, password_digest, first_name, last_name|
	User.create(
		id: id,
		username: username,
		email: email,
		password_digest: password_digest,
		first_name: first_name,
		last_name: last_name
	)
end