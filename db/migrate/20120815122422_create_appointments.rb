class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :group_id
      t.date :date_at
      t.boolean :canceled
      t.integer :reason
      t.string :comment

      t.timestamps
    end
    add_index :appointments, [:group_id, :date_at]
  end
end
