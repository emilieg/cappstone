class Resume < ActiveRecord::Base
	mount_uploader :attachment, AttachmentUploader #tells rails to use this uploader
	validates :name, presence: true #make sure owners name is present
end
