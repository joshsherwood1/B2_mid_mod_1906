class Author < ApplicationRecord
  has_many :author_books
  has_many :books, through: :author_books
  validates_presence_of :name

  def average_number_of_pages
    self.books.average(:number_of_pages)
  end
end
