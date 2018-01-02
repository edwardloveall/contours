class PointSelector
  include Math
  getter start_point, candidates, angle

  def initialize(
    start @start_point : Point,
    @candidates : Array(Point),
    @angle = 0.0
  )
  end
end
