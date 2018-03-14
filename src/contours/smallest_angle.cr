class Contours::SmallestAngle
  setter :origin, :points

  def initialize(@origin : Point, @points : Array(Point))
  end

  def biased_points
    @points.map { |point| point - @origin }
  end
end
