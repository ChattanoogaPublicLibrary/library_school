class RenameCourseIdToProposalIdInCourse < ActiveRecord::Migration
  def change
    rename_column :courses, :course_id, :proposal_id
  end
end
