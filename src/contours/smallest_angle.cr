class Contours::SmallestAngle
  setter :origin, :points, :offset_angle

  def initialize(@origin : Point, @points : Array(Point), @offset_angle = 0.0)
  end

  def find_point
    points = remove_backwards_point(@points)
    points = sort_by_clockwise_angle(points)
    points.first
  end

  def remove_backwards_point(points)
    points.reject do |point|
      @origin.angle_to(point) == @offset_angle
    end
  end

  def sort_by_clockwise_angle(points)
    points.sort_by do |point|
      (@origin.angle_to(point) - @offset_angle + TWO_PI) % TWO_PI
    end
  end
end
