require "../../spec_helper"

describe SVG::Path do
  describe "#tag_name" do
    it "returns `path`" do
      path.tag_name.should eq("path")
    end
  end

  describe "#raw_path_instructions" do
    it "returns the movment and line commands" do
      path.raw_path_instructions.should eq("M10 10 L 90 10 L 90 90 L 10 90")
    end

    context "when the path is closed" do
      it "returns the movment, line, and close commands" do
        saved_path = path

        saved_path.close!

        saved_path.raw_path_instructions.should eq("M10 10 L 90 10 L 90 90 L 10 90 Z")
      end
    end
  end

  describe "#tag_attributes" do
    it "returns the path instructions with `d:`" do
      path.tag_attributes.should eq({ d: "M10 10 L 90 10 L 90 90 L 10 90" })
    end
  end
end

private def path
  SVG::Path.new.tap do |path|
    path.points = [
      CrystalEdge::Vector3.new(x: 10.0, y: 10.0),
      CrystalEdge::Vector3.new(x: 90.0, y: 10.0),
      CrystalEdge::Vector3.new(x: 90.0, y: 90.0),
      CrystalEdge::Vector3.new(x: 10.0, y: 90.0)
    ]
  end
end
