class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :userID
      t.string :day
      t.timestamp :start
      t.timestamp :end

      t.timestamps
    end
  end
end
