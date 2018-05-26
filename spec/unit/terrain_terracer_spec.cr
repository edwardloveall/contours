require "../spec_helper"

describe Contours::TerrainTerracer do
  context "when there are no points" do
    it "returns an empty array" do
      levels = Contours::TerrainTerracer.terrace([] of Point)

      levels.should eq([] of Point)
    end
  end

  it "returns groups of points separated into their heigh tiers" do
    heights = [98, 1, 42, 43, 99]
    points = heights.map do |height|
      Point.new(z: height, x: 1, y: 1)
    end

    levels = Contours::TerrainTerracer.terrace(points, step: 10)

    levels[0].should contain_exactly([
      Point.new(z: 1, x: 1, y: 1)
    ])
    levels[4].should contain_exactly([
      Point.new(z: 42, x: 1, y: 1),
      Point.new(z: 43, x: 1, y: 1)
    ])
    levels[9].should contain_exactly([
      Point.new(z: 98, x: 1, y: 1),
      Point.new(z: 99, x: 1, y: 1)
    ])
  end
end
