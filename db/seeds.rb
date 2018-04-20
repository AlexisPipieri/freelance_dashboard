require 'yaml'

puts 'Destroying contacts and associated notes...'
Contact.destroy_all

puts 'Destroying organizations...'
Organization.destroy_all
puts 'Destroying quotes and associated tasks...'
Quote.destroy_all
puts 'Destroying users...'
User.destroy_all

file = Rails.root.join('db', 'seeds', 'seed.yml')
sample = YAML.load(open(file).read)

puts 'Creating users...'
users = {}
sample["users"].each do |user|
  users[user["email"]] = User.create! user.slice("email", "password",
    "first_name", "last_name", "address", "phone_number", "siret")
end

puts 'Creating organizations...'
organizations = {}
sample["organizations"].each do |organization|
  user = users[organization["user"]]
  organizations[organization["name"]] = Organization.create! organization.slice("name",
    "address").merge(user: user)
end

puts 'Creating contacts...'
contacts = {}
sample["contacts"].each do |contact|
  user = users[contact["user"]]
  organization = organizations[contact["organization"]]
  contacts[contact["email"]] = Contact.create! contact.slice("first_name",
    "last_name", "phone_number", "email", "organization",
    "user").merge(user: user).merge(organization: organization)
end

puts 'Creating notes...'
notes = {}
sample["notes"].each do |note|
  contact = contacts[note["contact"]]
  notes = Note.create! note.slice("description").merge(contact: contact)
end

puts 'Finished!'

