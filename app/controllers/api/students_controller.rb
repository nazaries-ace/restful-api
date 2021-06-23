class Api::StudentsController < Api::ApplicationController

    include PrettyDate
    include ValidateId
    
    def index
        students = Student.all
        students = students.map do |student|
            @course = Course.find(student.course_id)
            { id: student.id, name: student.name, course_enrolled_in: @course.name }
        end
        render json: { results: students }.to_json, status: :ok
    end

    def show
        if validate_id(Student,params[:id])
            student = Student.find(params[:id])
            enrolled = Course.find(student.course_id).name
            to_show = { name: student.name, enrolled_in: {
                course_name: enrolled,
                since: pretty_date(student.enrolled_from)
                } }
            render json: { results: to_show }.to_json, status: :ok
        else
            redirect_to api_students_path
        end
    end

    def create
        name = params[:name]
        course_id = params[:course_id]
        
        Student.create( 
            name: name, 
            course_id: course_id,
            enrolled_from: Time.now
        )
        redirect_to api_student_path(Student.last.id)
    end

    def update
        if validate_id(Student,params[:id])
            new_name = params[:name]
            course_id = params[:course_id]
            Student.find(params[:id]).update(name: new_name, course_id: course_id)
            render json: { results: "successfully updated" }.to_json, status: :ok
        else
            redirect_to api_students_path
        end
    end

    def destroy
        if validate_id(Student,params[:id])
            Student.find(params[:id]).destroy
            render json: { results: "successfully deleted" }.to_json, status: :ok
        else
            redirect_to api_students_path
        end
    end
end