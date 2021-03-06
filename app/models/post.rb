class Post < ActiveRecord::Base
  validates :image, presence: true
  has_attached_file :image, styles: { medium: "600"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
