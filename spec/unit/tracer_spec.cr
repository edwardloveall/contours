require "../spec_helper"

describe "#angle_between" do
  context "if the start point is at 0, 0" do
    it "returns the angle of point 2" do
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
end

private def tracer
  Contours::Tracer.new
end

private def delta
  1e-6
end
