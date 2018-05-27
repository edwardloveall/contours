require "../../spec_helper"

describe SVG::Document do
  describe "#text_content" do
    it "returns text representing an SVG file" do
      document.text_content.should eq <<-SVG
      <?xml version="1.0"?>
      <svg width="100" height="100" xmlns="http://www.w3.org/2000/svg"/>

      SVG
    end

    context "when the svg has elements" do
      it "returns text representing an SVG file" do
        svg = document
        path = SVG::Path.new
        path.points = [
          CrystalEdge::Vector3.new(x: 20.0, y: 0.0),
          CrystalEdge::Vector3.new(x: 0.0, y: 30.0)
        ]
        path.close!
        svg.elements << path
        svg.stylesheet = "path { fill: red; }"

        svg.text_content.should eq <<-SVG
        <?xml version="1.0"?>
        <svg width="100" height="100" xmlns="http://www.w3.org/2000/svg">
          <style>path { fill: red; }</style>
          <path d="M20 0 L 0 30 Z"/>
        </svg>

        SVG
      end
    end
  end

  describe "#write" do
    it "writes the svg file to a path" do
      location = "temp.svg"

      begin
        document.write(location)

        File.exists?(location).should be_true
      ensure
        FileUtils.rm_r(location)
      end
    end
  end
end

private def document
  SVG::Document.new(width: 100, height: 100)
end
