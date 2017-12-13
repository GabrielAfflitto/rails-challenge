class CreateGroupings < ActiveRecord::Migration[5.1]
  def change
    create_table :groupings do |t|
      t.string :student_name
      t.text :course_name

      t.timestamps
    end
  end
end
