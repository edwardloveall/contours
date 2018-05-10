require "../spec_helper"

describe Contours::PointGrouper do
  describe ".group" do
    context "when there are no points" do
      it "returns an empty array" do
        groups = Contours::PointGrouper.group([] of Point)

        groups.should eq([] of Array(Point))
      end
    end

    context "when there is a single group" do
      it "returns all points in one grouping" do
        points = [
          Point.new(2, 3),
          Point.new(3, 3),
          Point.new(2, 4),
          Point.new(3, 4)
        ]

        groups = Contours::PointGrouper.group(points)

        groups.first.should contain_exactly(points)
      end
    end
  end
end
