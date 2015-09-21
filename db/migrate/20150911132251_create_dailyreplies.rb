class CreateDailyreplies < ActiveRecord::Migration
  def change
    create_table :dailyreplies do |t|
      t.integer :daily_id
      t.integer :user_id
      t.string :nickname
      t.string :comment
      t.string :age
      t.string :sex
      t.string :job
      
      t.timestamps null: false
    end
  end
end
