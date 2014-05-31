class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :name
      t.string :description
      t.references :user, index: true

      t.timestamps
    end
  end
end
