class CreateCourseStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :course_students do |t|
      t.integer :course_id
      t.integer :student_id
    end

    add_index :courses, :course_id
    add_index :students, :students_id
  end
end
