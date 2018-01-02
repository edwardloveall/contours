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

  describe "#next_point" do
    it "returns the point with the farthest right hand turn from the start point and angle" do
      # ..x
      #  o
      #
      # angle: 0° (x-axis)
      next_point = Point.new(2.0, 2.0)
      start = Point.new(1.0, 1.0)
      candidates = [
        Point.new(0.0, 2.0),
        Point.new(1.0, 2.0),
        next_point
      ]
      selector = PointSelector.new(
        start: start,
        candidates: candidates,
        angle: 0.0
      )

      selector.next_point.should eq(next_point)
    end
  end
end
