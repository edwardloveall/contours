require "../spec_helper"

describe "#find" do
  it "finds the most bottom/right point it can in a set of points" do
    expected = Point.new(x: 10.0, y: 0.0)
    points = [
      expected,
      Point.new(x: 7.0, y: 10.0),
      Point.new(x: 0.0, y: 9.0),
      Point.new(x: 4.0, y: 3.0),
      Point.new(x: 4.0, y: 7.0),
      Point.new(x: 9.0, y: 3.0)
    ]
    finder = Contours::StartPointFinder.new(points: points)

    start_point = finder.find

    start_point.should eq(expected)
  end
end
