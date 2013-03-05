class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :requestID
      t.integer :tuteeID
      t.integer :tutorID
      t.string :day
      t.time :start
      t.time :end
      t.string :title
      t.string :status

      t.timestamps
    end
  end
end
