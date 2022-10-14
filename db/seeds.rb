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
        },
        {
        name: "Aakash Verma",
        class_year: "2023",
        membership_length: "1"
        },
        {
        name: "William Gretzinger",
        class_year: "2023",
        membership_length: "1"
        },
        {
        name: "Christian Contreras",
        class_year: "2023",
        membership_length: "1"
        },
        {
        name: "Brandon Salinas",
        class_year: "2023",
        membership_length: "1"
        }])

    Officer.create!([{
        person_id: Person.first.id,
        position: "President",
        email: "sjperry1999@tamu.edu",
        year_elected: "2022",
        description: "i am steven"
        },{
        person_id: Person.second.id,
        position: "Vice President External",
        email: "aakash25@tamu.edu",
        year_elected: "2022",
        description: "i am aakash"  
        },{
        person_id: Person.third.id,
        position: "Vice President Internal",
        email: "willgretz@tamu.edu",
        year_elected: "2022",
        description: "i am will"
        },{        
        person_id: Person.fourth.id,
        position: "Secretary",
        email: "christian02@tamu.edu",
        year_elected: "2022",
        description: "i am christian"},
        {
        person_id: Person.fifth.id,
        position: "Treasury",
        email: "Brandonovo@tamu.edu",
        year_elected: "2022",
        description: "i am brandon"}])
    p "Created #{Person.count} people"
    p "Created #{Officer.count} officers"
