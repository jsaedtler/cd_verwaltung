require 'spec_helper'

describe Track do
  describe "search" do
    before do
      @artist = Artist.create(:name => "Metallica")
      @album = @artist.albums.create(:title => "Master of Puppets")
      @track = @album.tracks.create(:title => "Orion")
    end
    
    it "should find tracks by track title" do
      Track.search('orion').first.title.should == @track.title
    end

    it "should find albums by artist name" do
      Track.search('allica').first.title.should == @track.title
    end
    
  end
end
