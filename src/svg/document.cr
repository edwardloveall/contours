require "xml"

class SVG::Document
  property :elements, :width, :height
  @elements = Array(SVG::Path).new

  NAMESPACE = "http://www.w3.org/2000/svg"

  def initialize(@width = 100, @height = 100)
  end

  def text_content
    XML.build(indent: "  ") do |xml|
      xml.element("svg", width: width, height: height, xmlns: NAMESPACE) do
        elements.each do |element|
          xml.element(element.tag_name, element.tag_attributes)
        end
      end
    end
  end

  def write(file_location)
    file = File.open(file_location, "w") do |file|
      file.write(text_content.to_slice)
    end
  end
end
