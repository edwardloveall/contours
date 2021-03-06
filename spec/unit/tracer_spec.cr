require "../spec_helper"

describe ".create_outline" do
  it "returns a list of points in order around the shape" do
    points = [
      Point.new(21, -2),
      Point.new(22, -2),
      Point.new(23, -2),
      Point.new(20, -1),
      Point.new(21, -1),
      Point.new(22, -1),
      Point.new(23, -1),
      Point.new(21, 0),
      Point.new(22, 0),
      Point.new(23, 0),
      Point.new(24, 0),
      Point.new(22, 1),
      Point.new(23, 1)
    ]
    outline = [
      Point.new(23, -2),
      Point.new(23, -1),
      Point.new(24, 0),
      Point.new(23, 1),
      Point.new(22, 1),
      Point.new(21, 0),
      Point.new(20, -1),
      Point.new(21, -2),
      Point.new(22, -2)
    ]
    tracer = Contours::Tracer.new(points: points)

    result = tracer.create_outline

    result.should eq(outline)
  end

  context "when there's a hollow center" do
    it "returns an ordered list of points around the shape" do
      points = [
        Point.new(29, -4),
        Point.new(30, -4),
        Point.new(32, -4),
        Point.new(28, -3),
        Point.new(29, -3),
        Point.new(30, -3),
        Point.new(31, -3),
        Point.new(32, -3),
        Point.new(33, -3),
        Point.new(28, -2),
        Point.new(29, -2),
        Point.new(32, -2),
        Point.new(33, -2),
        Point.new(28, -1),
        Point.new(29, -1),
        Point.new(32, -1),
        Point.new(33, -1),
        Point.new(29, 0),
        Point.new(30, 0),
        Point.new(31, 0),
        Point.new(32, 0),
        Point.new(33, 0),
        Point.new(30, 1),
        Point.new(31, 1),
        Point.new(32, 1)
      ]
      outline = [
        Point.new(32, -4),
        Point.new(33, -3),
        Point.new(33, -2),
        Point.new(33, -1),
        Point.new(33, 0),
        Point.new(32, 1),
        Point.new(31, 1),
        Point.new(30, 1),
        Point.new(29, 0),
        Point.new(28, -1),
        Point.new(28, -2),
        Point.new(28, -3),
        Point.new(29, -4),
        Point.new(30, -4),
        Point.new(31, -3)
      ]
      tracer = Contours::Tracer.new(points: points)

      result = tracer.create_outline

      result.should eq(outline)
    end
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
