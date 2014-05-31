class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :course, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
