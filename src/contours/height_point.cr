struct HeightPoint
  property point, height

  def initialize(@point : Point, @height : Float64)
  end

  def initialize(@point : Point, height : Int32)
    @height = height.to_f
  end
end
