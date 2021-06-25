# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create[{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.createname: 'Luke', movie: movies.first)


User.create(email:'jack@google.com',password:'123456')

# Mock courses
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

# Mock centers and assign almost 5 courses per center
centers = [
    
    'Wilkinson-Balistreri',
    'Weissnat-Tromp',
    'Lubowitz, Yundt and Homenick',
    'Grady LLC',
    'Wilkinson-Hauck',
    'Ortiz-Harris',
    'VonRueden-Renner',
    'Brekke LLC',
    'Hilll, Hamill and Spencer',
    'Jenkins, Stiedemann and Friesen'
    
]

@c_first = Course.first.id
@c_last = Course.last.id
# @tc_first = TrainningCenter.first
=begin
centers.each do |center|
    TrainningCenter.create(name: center)
    @tc_last = TrainningCenter.last.id
    @courses_quantity = rand(5..10)
    @counter = 1
    puts "last center id: #{@tc_last}"
    puts "courses to assign: #{@courses_quantity}"
    puts "-----------------"
    while @counter <= @courses_quantity do
        loop do
            @new_course = rand(@c_first..@c_last)
            puts "random course id: #{@new_course}"
            break if !CenterCourse.where(center_id: @tc_last, course_id: @new_course).exists?
            puts "repeated course in center #{@tc_last}, generating new..."

        end
        
        CenterCourse.create(center_id: @tc_last, course_id: @new_course)
        puts "Successfull course assignation"
        @counter += 1  
    end
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
    @new_course = rand(CenterCourse.first.id..CenterCourse.last.id)
    Student.create(
        name: student, 
        course_id: @new_course.course_id, 
        enrolled_from: rand(1.year).seconds.ago,
        center_id: @new_course.center_id
    )
end
=end

