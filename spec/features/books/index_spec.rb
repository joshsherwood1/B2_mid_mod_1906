require 'rails_helper'
RSpec.describe "When I visit the books index page" do
  before :each do
    @george = Author.create!(name: "George RR Martin")
    @mark = Author.create!(name: "Mark Lawrence")
    @random = Author.create!(name: "Random Author Name")
    @winds_of_winter = @george.books.create!(title: "Winds of Winter", number_of_pages: 1300, publication_year: 2019)
    @a_game_of_thrones = @george.books.create!(title: "A Game of Thrones", number_of_pages: 1100, publication_year: 1999)
    @prince_of_thorns = @mark.books.create!(title: "Prince of Thorns", number_of_pages: 690, publication_year: 2013)
    @random.books << @prince_of_thorns
  end
  it "shows each book in the system and each books information" do
    visit "/books"
    expect(page).to have_content("Title: #{@winds_of_winter.title}")
    expect(page).to have_content("Number of Pages: #{@winds_of_winter.number_of_pages}")
    expect(page).to have_content("Publication Year: #{@winds_of_winter.publication_year}")
    expect(page).to have_content(@george.name)
    expect(page).to have_content("Title: #{@prince_of_thorns.title}")
    expect(page).to have_content("Number of Pages: #{@prince_of_thorns.number_of_pages}")
    expect(page).to have_content("Publication Year: #{@prince_of_thorns.publication_year}")
    expect(page).to have_content(@random.name)
    expect(page).to have_content(@mark.name)
  end
end
