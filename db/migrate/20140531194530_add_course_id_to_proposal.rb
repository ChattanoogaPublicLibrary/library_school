class AddCourseIdToProposal < ActiveRecord::Migration
  def change
    add_column :proposals, :course_id, :integer
  end
end
