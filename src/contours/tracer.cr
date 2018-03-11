class Contours::Tracer
  TWO_PI = Math::PI * 2.0

  property used_points : Array(Point)
  @used_points = [] of Point

  def angle_between(point1 : Point, point2 : Point)
    biased_point2 = point2 - point1
    (biased_point2.angle + TWO_PI) % TWO_PI
  end

  def previous_point
    if @used_points.size > 1
      @used_points[-2]
    else
      @used_points[-1]
    end
  end
end
