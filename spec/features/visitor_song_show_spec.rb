require 'rails_helper'

describe "Visitor" do
  context "visits song show" do
    it "see genre names under a heading for genres associated with this song" do
      artist = Artist.create(name: 'Prince')
      song = artist.songs.create(title: 'song1', length: 100, play_count: 10, rating: 4, artist_id: artist.id)
      genre1 = song.genres.create(name: 'pop')
      genre2 = song.genres.create(name: 'dance')

      visit song_path(song)
      
      expect(page).to have_content("Genres for this Song:") 
      expect(page).to have_content(genre1.name) 
      expect(page).to have_content(genre2.name) 
    end
  end
end


=begin
User Story 7:

As a Visitor,
  When I visit a song show page,
    I see genre names under a heading that says "Genres for this Song:"
      and the genres listed are only the genres associated with this song.

Testing requirements:
- I should see at least 2 genres listed for a song
- Also include 1 or more genres that are NOT associated with this song and ensure
  they do not appear on the page
=end