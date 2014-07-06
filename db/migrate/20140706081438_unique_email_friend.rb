class UniqueEmailFriend < ActiveRecord::Migration
  def change
  	add_index :users, :email, unique: true
	add_index :users, :friendcode, unique:true
  end
end
