class RemoveColumns < ActiveRecord::Migration
  def up
    remove_column :destinations, :latitude, :longitude 
  end

  def down
    add_column :destinations, :latitude, :longitude
  end
end
