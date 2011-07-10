class Image < ActiveRecord::Base
  belongs_to :question

  has_attached_file :file,
                    :styles => { :thumb => "80x80>" },
                    :url    => "/assets/images/:style/:id.:extension",
                    :path   => ":rails_root/public/assets/images/:style/:id.:extension"

  validates_attachment_presence     :file
  validates_attachment_size         :file, :less_than => 4.megabytes
  validates_attachment_content_type :file, :content_type => ['image/jpeg', 'image/png']
end
