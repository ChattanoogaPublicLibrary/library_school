class RemoveVoteTypeAndAddCourseIdToVote < ActiveRecord::Migration
  def change
    remove_column :votes, :vote_type, :string
    add_column :votes, :course_id, :integer
  end
end
