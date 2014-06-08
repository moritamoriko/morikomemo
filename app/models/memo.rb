class Memo < ActiveRecord::Base
	belongs_to :user

  scope :posted, -> { where(posted: true)}
  scope :unposted, -> { where(posted: false)}

  auto_html_for :entry do
    html_escape
    image
    youtube(:width => 640, :height => 390, :autoplay => false)
    twitter
    soundcloud
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end

end
