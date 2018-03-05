class SVG::Path
  property :points
  @points = Array(CrystalEdge::Vector2).new
  @closed = false

  def tag_name
    "path"
  end

  def raw_path_instructions
    string = "M"
    point_string = points.map do |point|
      [point.x, point.y].map(&.to_i).join(" ")
    end
    string += point_string.join(" L ")
    string += " Z" if closed?
    string
  end

  def close!
    @closed = true
  end

  def closed?
    @closed
  end
end
