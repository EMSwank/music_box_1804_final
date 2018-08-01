require 'rails_helper'

describe Song, type: :model do
  describe 'validations' do
    it{should validate_presence_of(:title)}
    it{should validate_presence_of(:length)}
    it{should validate_presence_of(:play_count)}
  end

  describe 'relationships' do
    it{should belong_to(:artist)}
    it { should have_many(:song_genres) } 
    it { should have_many(:genres).through(:song_genres) } 
  end
  
  describe 'instance methods' do
    it '.average_rating' do
      artist = Artist.create(name: 'Prince')
      genre = Genre.create(name: 'pop')
      song1 = genre.songs.create(title: 'song1', length: 100, play_count: 10, rating: 4, artist_id: artist.id)
      song2 = genre.songs.create(title: 'song2', length: 100, play_count: 10, rating: 5, artist_id: artist.id)
      song3 = artist.songs.create(title: 'song2', length: 100, play_count: 10, rating: 5, artist_id: artist.id)

      expect(genre.songs.average_rating).to eq(4.5)
    end
  end
end
