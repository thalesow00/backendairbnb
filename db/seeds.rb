# db/seeds.rb

require 'faker'

puts "Nettoyage de la base de données..."
Reservation.destroy_all
Listing.destroy_all
City.destroy_all
User.destroy_all

puts "Création de 20 utilisateurs..."
20.times do
  User.create!(
    email: Faker::Internet.unique.email,
    phone_number: "0#{rand(1..9)}#{Array.new(8) { rand(0..9) }.join}", # numéro français simplifié
    description: Faker::Lorem.paragraph(sentence_count: 2)
  )
end

puts "Création de 10 villes..."
10.times do
  # Générer un zip_code valide avec format français simplifié ici (ex: 75001)
  zip_code = loop do
    code = "#{rand(10..95)}#{rand(0..9)}#{rand(0..9)}"
    break code if City.where(zip_code: code).empty?
  end

  City.create!(
    name: Faker::Address.city,
    zip_code: zip_code
  )
end

puts "Création de 50 listings..."
50.times do
  Listing.create!(
    available_beds: rand(1..5),
    price: rand(50..300),
    description: Faker::Lorem.paragraph_by_chars(number: 140, supplemental: false),
    has_wifi: [true, false].sample,
    welcome_message: Faker::Lorem.sentence,
    city: City.all.sample,
    user: User.all.sample
  )
end

puts "Création des réservations pour chaque listing..."
Listing.all.each do |listing|
  # 5 réservations dans le passé
  5.times do
    start_date = Faker::Date.between(from: 60.days.ago, to: 30.days.ago)
    end_date = start_date + rand(1..7).days

    Reservation.create!(
      start_date: start_date,
      end_date: end_date,
      listing: listing,
      user: User.all.sample
    )
  end

  # 5 réservations dans le futur
  5.times do
    start_date = Faker::Date.between(from: Date.tomorrow, to: 60.days.from_now)
    end_date = start_date + rand(1..7).days

    Reservation.create!(
      start_date: start_date,
      end_date: end_date,
      listing: listing,
      user: User.all.sample
    )
  end
end

puts "Seed terminé !"
