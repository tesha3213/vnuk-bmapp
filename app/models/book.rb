class Book < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  mount_uploader :bookfile, BookfileUploader
  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: 100}
  validates :description, presence: true, length: { maximum: 500 }
  validates :author, presence: true, length: { maximum: 140 }
  validates :year, presence: true, length: { maximum: 4 }
  validates :review, presence: true, length: { maximum: 500 }
  validate  :picture_size

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end


end
