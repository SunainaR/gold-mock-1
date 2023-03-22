require "track"

RSpec.describe Track do
  it "returns true for keyword match" do
    track = Track.new("Track1", "TrackCat")
    result = track.matches?("cat")
    expect(result).to eq true
  end

  it "returns false for keyword mismatch" do
    track = Track.new("Track1", "TrackCat")
    result = track.matches?("TWO")
    expect(result).to eq false
  end

end
