class RenameCourseIdToProposalIdInVotes < ActiveRecord::Migration
  def change
    rename_column :votes, :course_id, :proposal_id
  end
end
