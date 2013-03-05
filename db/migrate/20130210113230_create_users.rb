class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :username
      t.string :usertype
      t.string :gender
      t.date :birthday
      t.string :location
      t.string :description
      t.integer :rating

      t.timestamps
    end
  end
end
