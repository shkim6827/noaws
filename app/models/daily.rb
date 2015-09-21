class Daily < ActiveRecord::Base
    mount_uploader :my_image4, S3uploaderUploader
    mount_uploader :my_image5, S3uploaderUploader
    mount_uploader :my_image6, S3uploaderUploader

    
    has_many :dailyreplies
end
