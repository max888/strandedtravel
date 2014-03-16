class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :category_id
      t.text :description
      t.string :url
      t.integer :destination_id
      t.integer :user_id

      t.timestamps
    end
  end
end
