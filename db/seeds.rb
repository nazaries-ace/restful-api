# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create[{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.createname: 'Luke', movie: movies.first)

course_names = [
    
    'Help Desk Technician',
    'Data Coordiator',
    'Software Test Engineer',
    'Sales Associate',
    'VP Sales',
    'Help Desk Technician',
    'Quality Engineer',
    'Software Engineer'
]
course_names.each do |course|
    Course.create(name: course)
end

student_names = [
    "Glen Rouse",
    "Lyle Kauffman",
    "Kyler Ochoa",
    "Audrina Finn",
    "Fabio Fontai",
    "Leah Chatman",
    "Rose King",
    'Franky Breckenridge',
    'Danielle Persence',
    'Jules Schoffel',
    'Miguel Riditch',
    'Cherice Durston',
    'Velma Florentine',
    'Verine Chedzoy',
    'Angy Benaine',
    'Pyotr Rouch',
    'Pasquale Brailey',
    'Arlana Heinlein',
    'Tymothy Senter',
    'Adrien Maud',
    'Maegan Dannel',
    'Ferdinand Sherwin',
    'Guenevere Gaenor',
    'Moira Pashen',
    'Berke Bartlomiej',
    'Nikola O Mullen',
    'Lalo Canland'
]

student_names.each do |student|
    @first = Course.first
    @last = Course.last
    Student.create(
        name: student, 
        course_id: rand(@first.id..@last.id), 
        enrolled_from: rand(1.year).seconds.ago)
end

