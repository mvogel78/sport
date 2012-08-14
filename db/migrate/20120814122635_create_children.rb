class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :lastname
      t.string :firstname
      t.date :born_at
      t.boolean :female
      t.integer :zipcode

      t.timestamps
    end
  end
end
