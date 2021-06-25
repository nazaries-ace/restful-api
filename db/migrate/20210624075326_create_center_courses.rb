class CreateCenterCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :center_courses do |t|
      t.integer :center_id
      t.integer :course_id
      t.timestamps
    end
  end
end
