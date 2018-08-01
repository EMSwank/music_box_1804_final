require 'rails_helper'

describe "Visitor" do
  context "visits genre show" do
    it "sees all songs associated with that genre" do
      genre = Genre.create(name: 'pop')
      artist = Artist.create(name: 'Prince')
      song1 = genre.songs.create(title: 'song1', length: 100, play_count: 10, rating: 4, artist_id: artist.id)
      song2 = genre.songs.create(title: 'song2', length: 200, play_count: 50, rating: 3, artist_id: artist.id)

      visit genre_path(genre)

      expect(page).to have_content(song1.title) 
      expect(page).to have_content(song2.title) 
    end
    it 'see the average rating for all songs in this genre' do
      genre = Genre.create(name: 'pop')
      artist = Artist.create(name: 'Prince')
      song1 = genre.songs.create(title: 'song1', length: 100, play_count: 10, rating: 4, artist_id: artist.id)
      song2 = genre.songs.create(title: 'song2', length: 200, play_count: 50, rating: 3, artist_id: artist.id)
      song3 = Song.create(title: 'song3', length: 200, play_count: 44, rating: 2, artist_id: artist.id)

      visit genre_path(genre)

      expect(page).to have_content("Average rating for all songs: 3.5")
    end
  end
end


=begin
User Story 6:

As a Visitor,
  When I visit a genre show page,
    I see all songs associated with that genre listed on the page.

Testing requirements:
- I should see at least 2 songs listed for a genre
- Also include 1 or more songs that are NOT associated with this genre and ensure
  they do not appear on the page

User Story 8:

As a Visitor,
  When I visit a genre show page,
    I see the average rating for all songs in this genre

Testing requirements:
- I should add at least 2 songs for this genre
- Also include 1 or more songs NOT associated with this genre to ensure these
  other songs are not included in the average rating
=end
