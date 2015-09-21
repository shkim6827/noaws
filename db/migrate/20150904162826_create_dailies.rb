class CreateDailies < ActiveRecord::Migration
  def change
    create_table :dailies do |t|
      
      t.integer :user_id
      t.string :my_image4
      t.string :my_image5
      t.string :my_image6
      t.string :title
      t.string :hashtag
      t.integer :kg
      t.string :upsize
      t.string :downsize
      t.integer :tall
      t.string :image_file
      t.string :head
      t.string :top
      t.string :bottom
      t.string :shoes
      t.string :accessory
      t.string :etc
      t.integer :viewcount
    
      t.timestamps null: false
    end
  end
end
