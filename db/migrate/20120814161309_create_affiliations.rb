class CreateAffiliations < ActiveRecord::Migration
  def change
    create_table :affiliations do |t|
      t.integer :group_id
      t.integer :child_id

      t.timestamps
    end
    add_index :affiliations, :group_id
    add_index :affiliations, :child_id
    add_index :affiliations, [:group_id,:child_id], unique: true
  end
end
