class Contours::SmallestAngle
  setter :origin, :points

  def initialize(@origin : Point, @points : Array(Point))
  end

  def biased_points
    @points.map { |point| point - @origin }
  end

  def find_point
    @points.sort_by do |point|
      (@origin.angle_to(point) + TWO_PI) % TWO_PI
    end.first
  end
end
