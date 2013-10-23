class CreateDayRecords < ActiveRecord::Migration
  def change
    create_table :day_records do |t|
      t.date :LogData
      t.integer :LoggedHours
      t.boolean :Continuation
      t.integer :SoftwareVersion
      t.integer :FaultLog
      t.references :client, index: true

      t.timestamps
    end
  end
end
