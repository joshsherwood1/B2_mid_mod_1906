require "rails_helper"
RSpec.describe "As a User when I visit the book index page" do
  before :each do
    @george = Author.create!(name: "George RR Martin")
    @mark = Author.create!(name: "Mark Lawrence")
    @random = Author.create!(name: "Random Author Name")
    @winds_of_winter = @george.books.create!(title: "Winds of Winter", number_of_pages: 1300, publication_year: 2019)
    @a_game_of_thrones = @george.books.create!(title: "A Game of Thrones", number_of_pages: 1100, publication_year: 1999)
    @prince_of_thorns = @mark.books.create!(title: "Prince of Thorns", number_of_pages: 690, publication_year: 2013)
    @random.books << @prince_of_thorns
  end
  it "shows me a link on each authors name to go to that artist show page" do
    visit "/books"
    within ("#book-#{@prince_of_thorns.id}") do
      expect(page).to have_link(@mark.name)
    end
    within ("#book-#{@winds_of_winter.id}") do
      expect(page).to have_link(@george.name)
    end
    within ("#book-#{@a_game_of_thrones.id}") do
      expect(page).to have_link(@george.name)
    end
    within ("#book-#{@prince_of_thorns.id}") do
      expect(page).to have_link(@random.name)
    end
  end
  describe "As a User when I visit an artist show page" do
    before :each do
      @george = Author.create!(name: "George RR Martin")
      @mark = Author.create!(name: "Mark Lawrence")
      @random = Author.create!(name: "Random Author Name")
      @winds_of_winter = @george.books.create!(title: "Winds of Winter", number_of_pages: 1300, publication_year: 2019)
      @a_game_of_thrones = @george.books.create!(title: "A Game of Thrones", number_of_pages: 1100, publication_year: 1999)
      @prince_of_thorns = @mark.books.create!(title: "Prince of Thorns", number_of_pages: 690, publication_year: 2013)
      @random.books << @prince_of_thorns
    end
    it "it shows me an authors name, books that they have written, and average number of pages per book" do
      visit "/books"
      within ("#book-#{@winds_of_winter.id}") do
        click_link(@george.name)
      end
      expect(current_path).to eq("/authors/#{@george.id}")
      expect(page).to have_content("Name: #{@george.name}")
      expect(page).to have_content("Books:\n#{@winds_of_winter.title} #{@a_game_of_thrones.title}")
      expect(page).to have_content("Average Number of Pages per book: 1200.0 pages")
    end
    it "it shows me an authors name, books that they have written, and average number of pages per book" do
      visit "/books"
      within ("#book-#{@prince_of_thorns.id}") do
        click_link(@random.name)
      end
      expect(current_path).to eq("/authors/#{@random.id}")
      expect(page).to have_content("Name: #{@random.name}")
      expect(page).to have_content("Books:\n#{@prince_of_thorns.title}")
      expect(page).to have_content("Average Number of Pages per book: 690.0 pages")
    end
  end
end
