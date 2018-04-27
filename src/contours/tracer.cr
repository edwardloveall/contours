class Contours::Tracer
  property used_points : Array(Point)
  @used_points = [] of Point
  @points = [] of Point

  def self.create_outline(points : Array(Point))
    new(points: points).create_outline
  end

  def initialize(@points : Array(Point))
    start_point = StartPointFinder.new(points: @points).find
    @used_points.push(start_point)
  end

  def create_outline
    loop do
      @used_points.push(next_point)
      if @used_points.last == @used_points.first
        @used_points.pop
        break
      end
    end
    @used_points
  end

  def next_point
    if (previous_point == used_points[-1])
      backwards_direction = PI
    else
      backwards_direction = used_points[-1].angle_to(previous_point)
    end
    anchor_point = @used_points.last
    neighbors = GridNearestNeighbors.new(
      origin: anchor_point, points: @points
    ).find
    SmallestAngle.new(
      origin: anchor_point, points: neighbors, offset_angle: backwards_direction
    ).find_point
  end


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
