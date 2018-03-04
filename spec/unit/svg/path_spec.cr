require "../../spec_helper"

describe SVG::Path do
  describe "#tag_name" do
    it "returns `path`" do
      path.tag_name.should eq("path")
    end
  end
end

private def path
  SVG::Path.new.tap do |path|
  end
end
