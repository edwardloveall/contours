require "../spec_helper"

describe PointSelector do
  describe "#initialize" do
    it "uses 0 for the angle" do
      start = Point.new(1.0, 1.0)
      candidates = [] of Point
      selector = PointSelector.new(start: start, candidates: candidates)

      selector.angle.should eq(0)
    end
  end
end
