class Api::CoursesController < ActionController::API
    
    def index
        courses = Course.all
        courses = courses.map do |course|
            { id: course.id, name: course.name }
        end
        render json: { results: courses }.to_json, status: :ok
    end
    
    def show
        
        if Course.where(id: params[:id]).exists?(conditions = :none)
            course = Course.find(params[:id])
            students = Student.where(course_id: course.id)
            students = students.map do |student|
                enrolled_date = student.enrolled_from.to_s.split('T',1)[0].split(' ')
                enrolled_date = enrolled_date[0].to_s + '_' + enrolled_date[1].to_s
                { name: student.name, enrolled_since: enrolled_date }
            end
            if students.count > 0
                students_enrolled_in = students
            else
                students_enrolled_in = "No students enrolled"
            end
            course = { id: course.id, students_enrolled_in: students }
            render json: { results: course }.to_json, status: :ok
        else
            redirect_to api_courses_path
        end
    end
end