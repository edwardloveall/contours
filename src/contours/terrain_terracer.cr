class Contours::TerrainTerracer
  def self.terrace(points : Array(Point), step : Int32 = 10)
    new.terrace(points, step)
  end

  def terrace(points : Array(Point), step : Int32 = 10)
    levels = [] of Array(Point)
    return levels if points.empty?
    start = points.min_of { |point| point.z }
    current_level = start + step

    while !points.empty?
      level_points = points.select { |point| point.z < current_level }
      points = points - level_points
      levels.push(level_points)
      current_level += step
    end

    levels
  end
end
