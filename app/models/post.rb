class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    mount_uploader :avatar, PostImageUploader

    validates :avatar, presence: true
    validates :title, presence: true, length: { maximum: 255 }
    validates :body, presence: true, length: { maximum: 65535 }
end
