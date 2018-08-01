require 'rails_helper'

RSpec.describe SongGenre, type: :model do
it { should belong_to(:song) } 
it { should belong_to(:genre) } 
end
