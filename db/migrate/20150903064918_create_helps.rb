class CreateHelps < ActiveRecord::Migration
  def change
    create_table :helps do |t|
            # help db는 도움받을 데이터를 저장하는 곳입니다 ##
        t.integer :user_id
        t.string :title
        t.string :hashtag
        t.integer :tall
        t.integer :kg
        t.string :upsize
        t.string :downsize
        t.string :explain
        t.string :image_file
        t.string :my_image1
        t.string :my_image2
        t.string :my_image3
        t.string :userid
        t.integer :likeone
        t.integer :liketwo
        t.integer :manleftlike
        t.integer :manrightlike
        t.integer :womanleftlike
        t.integer :womanrightlike
        t.integer :viewcount
      t.timestamps null: false
    end
  end
end
