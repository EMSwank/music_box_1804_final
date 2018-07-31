require 'rails_helper'

RSpec.describe Genre, type: :model do
  it { should validate_presence_of(:name) }
  it { should have_many(:song_genres) } 
  it { should have_many(:songs).through(:song_genres) } 
end
