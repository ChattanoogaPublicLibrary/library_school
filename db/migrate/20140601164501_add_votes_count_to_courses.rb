class AddVotesCountToCourses < ActiveRecord::Migration
  def up
    add_column :courses, :votes_count, :integer, :default => 0, :null => false

    Course.select(:id).find_each do |r|
      Course.reset_counters(r.id, :votes)
    end
  end

  def down
    remove_column :courses, :votes_count
  end
end
