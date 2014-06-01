class AddClassSizesToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :minimum_class_size, :integer
    add_column :courses, :maximum_class_size, :integer
  end
end
