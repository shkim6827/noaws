class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      
      
        t.integer :help_id
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
