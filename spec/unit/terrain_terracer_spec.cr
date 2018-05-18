require "../spec_helper"

describe Contours::TerrainTerracer do
  context "when there are no points" do
    it "returns an empty array" do
      levels = Contours::TerrainTerracer.terrace([] of HeightPoint)

      levels.should eq([] of HeightPoint)
    end
  end

  it "returns groups of points separated into their heigh tiers" do
    dummy_point = Point.new(1, 1)
    heights = [98, 1, 42, 43, 99]
    points = heights.map do |height|
      HeightPoint.new(height: height, point: dummy_point)
    end

    levels = Contours::TerrainTerracer.terrace(points, step: 10)

    levels[0].should contain_exactly([
      HeightPoint.new(height: 1, point: dummy_point)
    ])
    levels[4].should contain_exactly([
      HeightPoint.new(height: 42, point: dummy_point),
      HeightPoint.new(height: 43, point: dummy_point)
    ])
    levels[9].should contain_exactly([
      HeightPoint.new(height: 98, point: dummy_point),
      HeightPoint.new(height: 99, point: dummy_point)
    ])
  end
end
