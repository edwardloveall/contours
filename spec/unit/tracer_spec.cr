require "../spec_helper"

describe ".create_outline" do
  it "returns a list of points" do
    points = [
      Point.new(17, 5),
      Point.new(20, 5),
      Point.new(23, 7),
      Point.new(20, 8),
      Point.new(18, 9),
      Point.new(26, 9),
      Point.new(15, 10),
      Point.new(19, 10),
      Point.new(24, 10),
      Point.new(22, 11),
      Point.new(15, 12),
      Point.new(18, 13),
      Point.new(20, 13),
      Point.new(24, 13),
      Point.new(22, 14),
      Point.new(15, 15),
      Point.new(18, 15),
      Point.new(19, 16),
      Point.new(23, 16),
      Point.new(25, 16)
    ]
    outline = [
      Point.new(20, 5),
      Point.new(23, 7),
      Point.new(26, 9),
      Point.new(24, 10),
      Point.new(24, 13),
      Point.new(25, 16),
      Point.new(23, 16),
      Point.new(19, 16),
      Point.new(18, 15),
      Point.new(15, 15),
      Point.new(15, 12),
      Point.new(15, 10),
      Point.new(18, 9),
      Point.new(17, 5)
    ]
    tracer = Contours::Tracer.new(points: points)

    result = tracer.create_outline

    tracer.debug
    result.should eq(outline)
  end
end

describe "#angle_between" do
  context "if the start point is at 0, 0" do
    it "returns the angle of point 2" do
      tracer = Contours::Tracer.new([] of Point)
      point1 = Point.new(0.0, 0.0)
      point2_q1 = Point.new(10.0, 10.0)
      point2_q2 = Point.new(-10.0, 10.0)
      point2_q3 = Point.new(-10.0, -10.0)
      point2_q4 = Point.new(10.0, -10.0)

      angle1 = tracer.angle_between(point1, point2_q1)
      angle2 = tracer.angle_between(point1, point2_q2)
      angle3 = tracer.angle_between(point1, point2_q3)
      angle4 = tracer.angle_between(point1, point2_q4)

      angle1.should be_close(45.deg_to_rad, delta)
      angle2.should be_close(135.deg_to_rad, delta)
      angle3.should be_close(225.deg_to_rad, delta)
      angle4.should be_close(315.deg_to_rad, delta)
    end
  end

  context "if the start point is not at 0, 0" do
    it "returns the angle of point 2 as if point 1 was at the origin" do
      tracer = Contours::Tracer.new([] of Point)
      point1 = Point.new(5.0, 5.0)
      point2_q1 = Point.new(15.0, 15.0)
      point2_q2 = Point.new(-5.0, 15.0)
      point2_q3 = Point.new(-5.0, -5.0)
      point2_q4 = Point.new(15.0, -5.0)

      angle1 = tracer.angle_between(point1, point2_q1)
      angle2 = tracer.angle_between(point1, point2_q2)
      angle3 = tracer.angle_between(point1, point2_q3)
      angle4 = tracer.angle_between(point1, point2_q4)

      angle1.should be_close(45.deg_to_rad, delta)
      angle2.should be_close(135.deg_to_rad, delta)
      angle3.should be_close(225.deg_to_rad, delta)
      angle4.should be_close(315.deg_to_rad, delta)
    end
  end

  describe "#previous_point" do
    context "if there is more than one point that has been used so far" do
      it "returns the second to last point" do
        tracer = Contours::Tracer.new([] of Point)
        first_point = Point.new(5.0, 5.0)
        second_point = Point.new(10.0, 10.0)
        third_point = Point.new(15.0, 15.0)
        tracer.used_points = [first_point, second_point, third_point]

        point = tracer.previous_point

        point.should eq(second_point)
      end
    end

    context "if there only one point that has been used so far" do
      it "returns the only point" do
        tracer = Contours::Tracer.new([] of Point)
        first_point = Point.new(5.0, 5.0)
        tracer.used_points = [first_point]

        point = tracer.previous_point

        point.should eq(first_point)
      end
    end
  end
end

private def delta
  1e-6
end
