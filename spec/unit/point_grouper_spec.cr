require "../spec_helper"

describe Contours::PointGrouper do
  describe ".group" do
    context "when there are no points" do
      it "returns an empty array" do
        groups = Contours::PointGrouper.group([] of Point)

        groups.should eq([] of Array(Point))
      end
    end

    context "when there is just one point" do
      it "returns a group of that one point" do
        points = [Point.new(0, 0)]
        groups = Contours::PointGrouper.group(points)

        groups.should eq([points])
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

        groups.size.should eq(1)
        groups.first.should contain_exactly(points)
      end
    end

    context "when there are multiple groups" do
      it "returns multiple point groups" do
        small = [
          Point.new(11, 10),
          Point.new(12, 10),
        ]
        medium = [
          Point.new(6, 4),
          Point.new(6, 5),
          Point.new(7, 5),
        ]
        large = [
          Point.new(2, 3),
          Point.new(3, 3),
          Point.new(2, 4),
          Point.new(3, 4)
        ]
        points = small + medium + large

        groups = Contours::PointGrouper.group(points)
        groups.sort_by!(&.size)

        groups.size.should eq(3)
        groups[0].should contain_exactly(small)
        groups[1].should contain_exactly(medium)
        groups[2].should contain_exactly(large)
      end
    end
  end
end
