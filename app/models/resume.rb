class Resume < ActiveRecord::Base
	has_many :job

  mount_uploader :attachment, AttachmentUploader
  validates :name, presenece: true
  validates :name, presence: true
  has_many :job
end
