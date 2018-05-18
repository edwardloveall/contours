class Contours::LevelSplitter
  def self.split(points : Array(HeightPoint), step : Int32 = 10)
    new.split(points, step)
  end

  def split(points : Array(HeightPoint), step : Int32 = 10)
    levels = [] of Array(HeightPoint)
    return levels if points.empty?
    start = points.min_of { |point| point.height }
    current_level = start + step

    while !points.empty?
      level_points = points.select { |point| point.height < current_level }
      points = points - level_points
      levels.push(level_points)
      current_level += step
    end

    levels
  end
end
