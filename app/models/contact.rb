class Contact < ActiveRecord::Base
  belongs_to :company
  # validates :phone => {:ten_digits => true, :seven_digits => true, :allow_blank => true, :allow_nil => true, :message => "Phone number must be either seven or digits in length, or blank."}
end
