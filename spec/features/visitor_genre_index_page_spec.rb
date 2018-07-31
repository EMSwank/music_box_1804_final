require 'rails_helper'

describe "Visitor" do
  context "visits genre index" do
    it "see all genres in the db" do
      genre1 = Genre.create(name: "rock")
      genre2 = Genre.create(name: "roll")

      visit genres_path

      expect(page).to have_link(genre1.name) 
      expect(page).to have_link(genre2.name) 
    end

    it 'cannot see the form to create new genres' do
      genre1 = Genre.create(name: "rock")
      genre2 = Genre.create(name: "roll")

      visit genres_path

      expect(page).to_not have_css("form")

      click_on genre1.name

      expect(current_path).to eq(genre_path(genre1))
    end
  end
end

=begin
User Story 2:

As a Visitor,
  When I visit the genre index page,
    I see all genres in the database.

Testing requirements:
- users should see at least 2 genres listed on the page

User Story 5:

As a Visitor,
  When I visit the genre index page,
    I cannot see the form to create new genres, 
      And I do not have access to any routes that could create a genre.
    And each genre's name should be a link to that genre's show page.

Testing requirements:
- I should see at least 2 genres listed
- All users of the web site see the genres' names as links
=end