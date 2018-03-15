class Contours::SmallestAngle
  setter :origin, :points, :offset_angle

  def initialize(@origin : Point, @points : Array(Point), @offset_angle = 0.0)
  end

  def biased_points
    @points.map { |point| point - @origin }
  end

  def find_point
    @points.sort_by do |point|
      (@origin.angle_to(point) - @offset_angle + TWO_PI) % TWO_PI
    end.first
  end
end
