require "../spec_helper"

describe Contours::GridNearestNeighbors do
  describe "#find" do
    it "returns all points one step away (including diagonals)" do
      origin = Point.new(0, 0)
      near_points = [
        Point.new(0, 1),
        Point.new(1, 1)
      ]
      far_points = [
        Point.new(0, 2),
        Point.new(0, 10)
      ]
      points = near_points + far_points
      finder = Contours::GridNearestNeighbors.new(origin: origin, points: points)

      result = finder.find

      result.should eq(near_points)
    end

    it "doesn't return the origin point" do
      origin = Point.new(0, 0)
      near_points = [
        Point.new(0, 1),
        Point.new(1, 1)
      ]
      points = near_points + [origin]
      finder = Contours::GridNearestNeighbors.new(origin: origin, points: points)

      result = finder.find

      result.should eq(near_points)
    end
  end
end
