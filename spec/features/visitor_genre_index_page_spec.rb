require 'rails_helper'

describe "Visitor" do
  context "visits genre index" do
    it "see all genres in the db" do
      genre1 = Genre.create(name: "rock")
      genre2 = Genre.create(name: "roll")

      visit genres_path

      expect(page).to have_content(genre1.name) 
      expect(page).to have_content(genre2.name) 
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
=end