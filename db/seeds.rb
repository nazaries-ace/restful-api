# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create[{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.createname: 'Luke', movie: movies.first)
student_names = [
    "Glen Rouse",
    "Lyle Kauffman",
    "Kyler Ochoa",
    "Audrina Finn",
    "Fabio Fontai",
    "Leah Chatman",
    "Rose King",
]

student_names.each do |student|
    Student.create(name: student)
end

course_names = [
    
    'Help Desk Technician',
    'Data Coordiator',
    'Software Test Engineer IV',
    'Sales Associate',
    'VP Sales',
    'Help Desk Technician',
    'Help Desk Technician',
    'Quality Engineer',
    'Nurse Practicioner',
    'Teacher'
]
course_names.each do |course|
    Course.create(name: course)
end