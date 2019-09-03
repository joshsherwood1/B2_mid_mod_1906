require 'rails_helper'

describe Author, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it {should have_many :author_books}
    it {should have_many(:books).through(:author_books)}
  end

  describe "instance methods" do
    it "can calculate average number of pages per book by the author" do
    george = Author.create!(name: "George RR Martin")
    winds_of_winter = george.books.create!(title: "Winds of Winter", number_of_pages: 1300, publication_year: 2019)
    a_game_of_thrones = george.books.create!(title: "A Game of Thrones", number_of_pages: 1100, publication_year: 1999)
    expect(george.average_number_of_pages).to eq(1200.0)
    end
  end
end
