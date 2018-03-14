require "../spec_helper"

describe Contours::SmallestAngle do
  describe "#biased_points" do
    it "adjusts points so their origin is some arbitrary point" do
      points = [
        Point.new(10.0, 2.0),
        Point.new(-5.0, -4.0),
        Point.new(-4.0, 0.0),
        Point.new(2.0, 10.0)
      ]
      origin = Point.new(3.0, 3.0)
      adjusted = [
        Point.new(7.0, -1.0),
        Point.new(-8.0, -7.0),
        Point.new(-7.0, -3.0),
        Point.new(-1.0, 7.0)
      ]
      smallest = Contours::SmallestAngle.new(origin: origin, points: points)

      result = smallest.biased_points

      result.should eq(adjusted)
    end
  end

  describe "#find_point" do
    context "when the offset angle is 0 radians" do
      it "finds the point with the smallest clockwise angle" do
        target = Point.new(7.0, 4.0)
        points = [
          Point.new(3.0, 0.0),
          Point.new(6.0, -1.0),
          Point.new(4.0, 8.0),
          target,
          Point.new(0.0, -1.0),
          Point.new(-2.0, 7.0),
          Point.new(0.0, 5.0)
        ]
        origin = Point.new(3.0, 3.0)
        smallest = Contours::SmallestAngle.new(origin: origin, points: points)

        result = smallest.find_point

        result.should eq(target)
      end
    end
  end
end
