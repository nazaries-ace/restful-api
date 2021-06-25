class AddCenterToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :trainning_centers_id, :integer
  end
end
