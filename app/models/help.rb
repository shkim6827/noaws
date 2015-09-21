class Help < ActiveRecord::Base
    self.per_page = 8
    mount_uploader :my_image1, S3uploaderUploader
    mount_uploader :my_image2, S3uploaderUploader
    has_many :replies
    
    def self.search(search)
        if search
            find(:all, :hashtag => ['name LIKE ?', "%#{search}%"])
        else
            find(:all)
        end
    end
end
