class Book < ApplicationRecord
  has_many :author_books
  has_many :authors, through: :author_books
  validates_presence_of :title
  validates_presence_of :number_of_pages
  validates_presence_of :publication_year
end
