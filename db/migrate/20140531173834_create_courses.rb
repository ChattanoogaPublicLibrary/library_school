class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.boolean :status
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
