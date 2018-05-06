require "../spec_helper"

describe Contours::SmallestAngle do
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

    context "when the offset angle is 45 deg (PI/4 radians)" do
      it "finds the point with the smallest clockwise angle" do
        target = Point.new(4.0, 8.0)
        points = [
          Point.new(3.0, 0.0),
          Point.new(6.0, -1.0),
          Point.new(7.0, 4.0),
          target,
          Point.new(0.0, -1.0),
          Point.new(-2.0, 7.0),
          Point.new(0.0, 5.0)
        ]
        origin = Point.new(3.0, 3.0)
        smallest = Contours::SmallestAngle.new(
          origin: origin, points: points, offset_angle: Math::PI/4
        )

        result = smallest.find_point

        result.should eq(target)
      end
    end
  end
end
