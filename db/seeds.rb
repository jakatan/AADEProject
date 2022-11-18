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
        membership_length: "1",
        email: "sjperry1999@tamu.edu",
        is_admin: true
        },
        {
        name: "Aakash Verma",
        class_year: "2023",
        membership_length: "1",
        email: "aakash25@tamu.edu",
        is_admin: true
        },
        {
        name: "William Gretzinger",
        class_year: "2023",
        membership_length: "1",
        email: "willgretz@tamu.edu",
        is_admin: true
        },
        {
        name: "Christian Contreras",
        class_year: "2023",
        membership_length: "1",
        email: "christian02@tamu.edu",
        is_admin: true
        },
        {
        name: "Brandon Salinas",
        class_year: "2023",
        membership_length: "1",
        email: "Brandonovo@tamu.edu",
        is_admin: true
        }])

    Officer.create!([{
        person_id: Person.first.id,
        position: "President",
        year_elected: "2022",
        description: "Petroleum Engineering"
        },{
        person_id: Person.second.id,
        position: "VP External",
        year_elected: "2022",
        description: "Petroleum Engineering"  
        },{
        person_id: Person.third.id,
        position: "VP Internal",
        year_elected: "2022",
        description: "Petroleum Engineering"
        },{        
        person_id: Person.fourth.id,
        position: "Secretary",
        year_elected: "2022",
        description: "Petroleum Engineering"
         },{
        person_id: Person.fifth.id,
        position: "Treasury",
        year_elected: "2022",
        description: "Petroleum Engineering"}])

    p "Created #{Person.count} people"

    p "Created #{Officer.count} officers"


     Person.create!([{
           name: "DEV",
           class_year: "na",
           membership_length: "na",
           email: "davidking@tamu.edu",
           is_admin: true
      },
      {
           name: "DEV",
           class_year: "na",
           membership_length: "na",
           email: "jakatanugraha@tamu.edu",
           is_admin: true
      },
      {
           name: "DEV",
           class_year: "na",
           membership_length: "na",
           email: "andrew.hooper14@tamu.edu",
           is_admin: true
      },
      {
           name: "DEV",
           class_year: "na",
           membership_length: "na",
           email: "cjstech@tamu.edu",
           is_admin: true
      },
      {
           name: "DEV",
           class_year: "na",
           membership_length: "na",
           email: "leanne.khashab.1@tamu.edu",
           is_admin: true
      },
      {
           name: "DEV",
           class_year: "na",
           membership_length: "na",
           email: "jlbreeden21@tamu.edu",
           is_admin: true
      }])

##Delete any existing files stored
ActiveStorage::Attachment.all.each { |attachment| attachment.purge }