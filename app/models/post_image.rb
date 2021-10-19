class PostImage < ApplicationRecord

  belongs_to:user
  attachment:image
  # id省略は、attachmentの機能
  has_many:post_comments,dependent: :destroy

end
