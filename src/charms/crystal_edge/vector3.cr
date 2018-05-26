struct CrystalEdge::Vector3
  def initialize(x : Int32, y : Int32, z : Int32 = 0)
    @x = x.to_f
    @y = y.to_f
    @z = z.to_f
  end

  def initialize(x : Float, y : Float, z : Float = 0.0)
    @x = x.to_f
    @y = y.to_f
    @z = z.to_f
  end

  def to_s(io)
    io.write_utf8("(#{@x}, #{@y}, #{@z})".to_slice)
  end

  def inspect
    "(#{@x}, #{@y}, #{@z})"
  end

  def angle_to(other : Vector3)
    (other - self).angle.z
  end
end
