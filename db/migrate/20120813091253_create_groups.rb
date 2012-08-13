class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :user_id
      t.date :starts_at
      t.date :ends_at
      t.integer :agegroup
      t.integer :category
      t.integer :duration
      t.integer :intermittency
      t.boolean :kindergarden
      t.timestamps
    end
    add_index :groups, [ :user_id, :starts_at ]
  end
end
