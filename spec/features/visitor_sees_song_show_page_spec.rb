require 'rails_helper'

describe "A visitor" do
  context "visits song show page" do
    it "sees the numeric rating for the song" do
      artist = Artist.create(name: 'Prince')
      song = artist.songs.create(title: 'song1', length: 100, play_count: 10, rating: 4)

      visit song_path(song)

      expect(page).to have_content(song.rating) 
    end
  end
end

=begin
User Story 1:

As a Visitor,
  When I visit a song show page,
    I see the numeric rating for this song

Testing requirements:
- rating should be an integer attribute (from 1 to 5)
=end