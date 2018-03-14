class Contours::SmallestAngle
  setter :origin, :points

  def initialize(@origin : Point, @points : Array(Point))
  end

  def biased_points
    @points.map { |point| point - @origin }
  end

  def find_point
    @points.sort_by do |point|
      biased_point = point - @origin
      (biased_point.angle + TWO_PI) % TWO_PI
    end.first
  end
end
