class Api::StudentsController < ActionController::API
    
    def index
        students = Student.all
        students = students.map do |student|
            @course = Course.find(student.course_id)
            { id: student.id, name: student.name, course_enrolled_in: @course.name }
        end
        render json: { results: students }.to_json, status: :ok
    end
end