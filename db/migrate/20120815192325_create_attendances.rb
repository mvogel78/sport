class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :appointment_id
      t.integer :child_id
      t.boolean :absence
      t.integer :reason
      t.string :comment

      t.timestamps
    end
    add_index :attendances, :appointment_id
    add_index :attendances, :child_id
    add_index :attendances, [:appointment_id, :child_id], unique: true
  end
end
