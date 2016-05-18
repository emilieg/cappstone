class Resume < ActiveRecord::Base
	mount_uploader :attachment, AttachmentUploader 
	validates :name, presence: true #make sure owners name is present
end
