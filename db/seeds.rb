# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

kinds = %w(Amigo Comercial Conhecido)

kinds.each do |kind|
  Kind.create!(
    description: kind
  )
end

10.times do |i|
  Contact.create!(
    name: Faker::Name.name,
    email:Faker::Internet.email,
    birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
    kind: Kind.all.sample
  )
end

Contact.all.each do |contact|
  Random.rand(5).times do |i|
    phone = Phone.create!(number:Faker::PhoneNumber.cell_phone, contact: contact)
    contact.phones << phone
    contact.save!
  end
end

Contact.all.each do |contact| 
  Address.create(
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    contact: contact)
end
