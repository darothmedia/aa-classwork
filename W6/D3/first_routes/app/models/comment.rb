class Comment < ApplicationRecord
  validates :body, :user_id, :artwork_id, presence: true

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User,
    dependent: :destroy

  belongs_to :artwork,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Artwork,
    dependent: :destroy
end
