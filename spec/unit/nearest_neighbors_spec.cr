require "../spec_helper"

describe Contours::NearestNeighbors do
  describe ".find" do
    context "when there is no tie for points fitting within the threshold" do
      it "returns n points" do
        origin = Point.new(0.0, 0.0)
        near_points = [
          Point.new(0.0, 1.0),
          Point.new(0.0, -1.0),
          Point.new(1.0, -1.0)
        ]
        far_points = [
          Point.new(10.0, 10.0),
          Point.new(-20.0, 3.0),
          Point.new(17.0, -14.0)
        ]
        points = near_points + far_points
        finder = Contours::NearestNeighbors.new(origin: origin, points: points)

        result = finder.find(at_least: 3)

        result.should eq(near_points)
      end
    end

    context "when there is a tie for points fitting within the threshold" do
      it "returns n points" do
        origin = Point.new(0.0, 0.0)
        near_points = [
          Point.new(0.0, 1.0),
          Point.new(0.0, -1.0)
        ]
        finder = Contours::NearestNeighbors.new(origin: origin, points: near_points)

        result = finder.find(at_least: 1)

        result.should eq(near_points)
      end
    end
  end
end
