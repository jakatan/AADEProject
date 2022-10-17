# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    Person.destroy_all
    
    Person.create!([{
        name: "Stephen Perry",
        class_year: "2023",
        membership_length: "1"
    }])
    p "Created #{Person.count} people"

    Admin.destroy_all
    Admin.create!(email: 'davidking@tamu.edu')
    Admin.create!(email: 'jakatanugraha@tamu.edu')
    Admin.create!(email: 'andrew.hooper14@tamu.edu')
    Admin.create!(email: 'cjstech@tamu.edu')
    Admin.create!(email: 'leanne.khashab.1@tamu.edu')
    Admin.create!(email: 'jlbreeden21@tamu.edu')
    p "Created #{Admin.count} admins"
