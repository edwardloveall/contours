struct CrystalEdge::Vector2
  def initialize(x : Int32, y : Int32)
    @x = x.to_f
    @y = y.to_f
  end

  def angle_to(other : Vector2)
    (other - self).angle
  end
end
