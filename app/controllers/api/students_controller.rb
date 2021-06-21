class Api::StudentsController < ActionController::API
    
    def index
        students = Student.all
        students = students.map do |student|
            { id: student.id, name: student.name }
        end
        render json: { results: students }.to_json, status: :ok
    end
end