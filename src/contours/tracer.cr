class Contours::Tracer
  TWO_PI = Math::PI * 2.0

  def angle_between(point1 : Point, point2 : Point)
    biased_point2 = point2 - point1
    (biased_point2.angle + TWO_PI) % TWO_PI
  end
end
