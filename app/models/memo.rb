class Memo < ActiveRecord::Base
	belongs_to :user

  scope :posted, -> { where(posted: true)}
  scope :unposted, -> { where(posted: false)}

end
