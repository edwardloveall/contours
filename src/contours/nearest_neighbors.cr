class Contours::NearestNeighbors
  setter origin, points

  def initialize(@origin : Point, @points : Array(Point))
  end

  def find(at_least count : Int32)
    sorted_points = @points.sort_by { |point| point.distance(@origin) }
    target_distance = sorted_points[count - 1].distance(@origin)
    sorted_points.select do |point|
      point.distance(@origin) <= target_distance
    end
  end
end
