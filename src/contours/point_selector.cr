class PointSelector
  include Math
  getter start_point, candidates, angle

  def initialize(
    start @start_point : Point,
    @candidates : Array(Point),
    @angle = 0.0
  )
  end

  def next_point
    largest_angle = 0
    point = Point.zero
    x = cos(PI - angle)
    y = sin(angle)
    origin = Point.new(x, y)
    candidates.each do |candidate|
      normalized_candidate = candidate - start_point
      # make them into a triangle by adding the differece between them as the two sides
      # use the law of cosines to get the cos of the angle (ratio) between the two vectors
      dot = origin.dot(normalized_candidate)
      product_magnitude = origin.magnitude * normalized_candidate.magnitude
      angle_as_ratio = dot / product_magnitude
      # use arc (inverse) cosine to get the angle in radians
      radians = acos(angle_as_ratio)
      if radians > largest_angle
        largest_angle = radians
        point = candidate
      end
    end

    point
  end
end
