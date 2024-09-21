class Genre < ApplicationRecord
  has_many :books

  validates :name, presence: true, length: { maximum: 10 }
end
