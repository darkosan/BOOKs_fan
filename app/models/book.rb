class Book < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one_attached :image

  validates :title, presence: true
  validates :body, presence: true
  validates :genre, presence: true

  scope :search_by_title, -> (search, title) do
    sanitezed_title = sanitize_sql_like(title)
    case search
    when "perfect_match"
      where("title LIKE ?", "#{sanitezed_title}")
    when "forward_match"
      where("title LIKE ?", "#{sanitezed_title}%")
    when "backward_match"
      where("title LIKE ?", "%#{sanitezed_title}")
    when "partial_match"
      where("title LIKE ?", "%#{sanitezed_title}%")
    else
      all
    end
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_book.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [300, 300]).processed
  end

  def genre_name
    genre.name if genre.present?
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end