class Resume < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
  validates :name, presenece: true
  validates :name, presence: true
  has_many :job
end
