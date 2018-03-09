class Contours::StartPointFinder
  property :points

  def initialize(@points : Array(Point))
  end

  def find
    min_y = @points.min_of { |point| point.y }
    min_y_points = @points.select { |point| point.y == min_y }
    min_y_points.max_by { |point| point.x }
  end
end
