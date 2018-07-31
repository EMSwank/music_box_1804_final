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
=end