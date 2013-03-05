class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.integer :classID
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
