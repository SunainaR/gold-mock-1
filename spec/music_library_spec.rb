require "music_library"

RSpec.describe MusicLibrary do
  context "intial" do
    it "" do
      library = MusicLibrary.new
      expect(library.all).to eq []
    end
  end

  context "Returning track where tracks have been added" do
    it "Returns two tracks in a list" do
      library = MusicLibrary.new
      #track_1 = instance_double("Fred Williams", "Tell Her")
      track_1 = double :Track
      library.add(track_1)
      expect(library.all).to eq [track_1]
    end

    it "Returns two tracks in a list" do
      library = MusicLibrary.new
      track_1 = double :Track
      track_2 = double :Track
      library.add(track_1)
      library.add(track_2)
      expect(library.all).to eq [track_1, track_2]
    end
  end
  # Note: here we aren't checking if the method is being called with the same arugment in spec and in the music_library script. This unit test will pass.
  context "Returning tracks for keyword search" do
    it "Returns two tracks in a list that meet search criteria" do
      library = MusicLibrary.new
      track_1 = double :track, matches?: false
      track_2 = double :track, matches?: true
      track_3 = double :track, matches?: true
      library.add(track_1)
      library.add(track_2)
      library.add(track_3)
      expect(library.search("The")).to eq [track_2, track_3]
    end

    # Can check the correct argument is being called (in the mai script i.e. keyword instead of "iuwhe") with this:
    context "Returning tracks for keyword search" do
      it "Returns two tracks in a list that meet search criteria" do
        library = MusicLibrary.new
        track_1 = double :track, matches?: false
        expect(track_1).to receive(:matches?).with("The").and_return(false)
        track_2 = double :track, matches?: true
        expect(track_2).to receive(:matches?).with("The").and_return(true)
        track_3 = double :track, matches?: true
        expect(track_3).to receive(:matches?).with("The").and_return(true)
        library.add(track_1)
        library.add(track_2)
        library.add(track_3)
        expect(library.search("The")).to eq [track_2, track_3]
      end
    end

    it "Returns two tracks in a list that meet search criteria" do
      library = MusicLibrary.new
      track_3 = double(:track, matches?: true)
      library.add(track_3)
      expect(library.search("The")).to eq [track_3]
    end
  end

end