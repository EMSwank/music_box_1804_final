require 'rails_helper'

describe "Admin" do
  context "visits genre index" do
    it "sees form to create genre" do
      admin = User.create(username: 'bob', password: 'dave', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit genres_path

      expect(page).to have_css("form")

      fill_in :genre_name,	with: "jazz"
    end

    it 'fills out a form and creates a new genre and redirects to genre index' do
      genre1 = Genre.create(name: "rock")
      genre2 = Genre.create(name: "roll")
      admin = User.create(username: 'bob', password: 'dave', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit genres_path

      fill_in :genre_name,	with: "Jazz"
      click_on "Create Genre"

      expect(current_path).to eq(genres_path)
      expect(page).to have_content(genre1.name)
      expect(page).to have_content(genre2.name)
      expect(page).to have_content("Jazz")
    end

    it 'displays flash message when genre fails to create' do
      genre1 = Genre.create(name: "rock")
      genre2 = Genre.create(name: "roll")
      admin = User.create(username: 'bob', password: 'dave', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit genres_path

      click_on "Create Genre"

      expect(page).to have_content('Genre cannot be created, please make sure to fill the form correctly') 
      expect(current_path).to eq(genres_path)

    end
  end
end


=begin
User Story 3:

As an admin user, 
  When I visit the same genre index page that visitors see,
  I see the same information visitors see,
    And I also see a form to create a new genre.
  
Testing requirements:
- users should see at least 2 genres listed on the page

User Story 4:

As an admin user, 
  When I visit the genre index page,
    And I fill out the form with a new genre's name and submit that form, 
  I return to the genre index page,
    And I see all previous genres and the new genre I have just created.

Testing requirements:
- I should see at least 2 previous genres listed plus the new genre
=end