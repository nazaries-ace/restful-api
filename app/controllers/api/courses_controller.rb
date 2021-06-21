class Api::CoursesController < ActionController::API
    
    def index
        courses = Course.all
        courses = courses.map do |course|
            { id: course.id, name: course.name }
        end
        render json: { results: courses }.to_json, status: :ok
    end
end