class AddVotesCountToProposals < ActiveRecord::Migration
  def up
    add_column :proposals, :votes_count, :integer, :default => 0, :null => false

    Proposal.select(:id).find_each do |r|
      Proposal.reset_counters(r.id, :votes)
    end
  end

  def down
    remove_column :proposals, :votes_count
  end
end
