class ChangeDescriptionToTextInProposal < ActiveRecord::Migration
  def change
    change_column :proposals, :description, :text
  end
end
