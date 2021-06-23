class Api::CoursesController < ActionController::API
    include PrettyDate
    include ValidateId

    def index
        courses = Course.all
        courses = courses.map do |course|
            { id: course.id, name: course.name }
        end
        render json: { results: courses }.to_json, status: :ok
    end
    
    def show
        
        if validate_id(Course,params[:id])
            course = Course.find(params[:id])
            students = Student.where(course_id: course.id)
            students_enrolled_in = "No students enrolled"
            if students.count > 0
                students = students.map do |student|
                    { name: student.name, enrolled_since: pretty_date(student.enrolled_from) }
                end
                students_enrolled_in = students
            end
            course = { name: course.name, students_enrolled_in: students_enrolled_in }
            render json: { results: course }.to_json, status: :ok
        else
            redirect_to api_courses_path
        end
    end

    def create
        course = params[:name]
        Course.create(name: course)
        redirect_to api_course_path(Course.last.id)
    end

    def update
        if validate_id(Course,params[:id])
            new_name = params[:name]
            Course.find(params[:id]).update(name: new_name)
            render json: { results: "successfully updated" }.to_json, status: :ok
        else
            redirect_to api_students_path
        end
    end

    def destroy
        if validate_id(Course,params[:id])
            Course.find(params[:id]).destroy
            render json: { results: "successfully deleted" }.to_json, status: :ok
        else
            redirect_to api_courses_path
        end
    end
end