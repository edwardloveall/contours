class Contours::LevelSplitter
  def self.split(
    points : Array(HeightPoint),
    start : Int32 = 0,
    step : Int32 = 10
  )
    new.split(points, start, step)
  end

  def split(points : Array(HeightPoint), start : Int32 = 0, step : Int32 = 10)
    return [] of Array(HeightPoint) if points.empty?
    max = points.max_of { |point| point.height }.ceil.to_i
    range_starts = (0..max).step(step).to_a
    ranges = range_starts.map_with_index do |low, index|
      high = range_starts[index + 1]?
      if !high.nil?
        (low...high)
      else
        (low..max)
      end
    end

    ranges.map do |range|
      points.select { |point| range.includes?(point.height) }
    end
  end
end
