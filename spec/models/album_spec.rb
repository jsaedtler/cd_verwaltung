require 'spec_helper'

describe Album do
  describe "search" do
    before do
      @artist = Artist.create(:name => "Metallica")
      @album = @artist.albums.create(:title => "Master of Puppets")
    end
    
    it "should find albums by album title" do
      Album.search('uppet').first.title.should == @album.title
    end

    it "should find albums by artist name" do
      Album.search('allica').first.title.should == @album.title
    end

  end
end
