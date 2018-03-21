class Contours::GridNearestNeighbors
  setter origin, points

  def initialize(@origin : Point, @points : Array(Point))
  end

  def find
    @points.select do |point|
      (-1..1).includes?(point.x - @origin.x) &&
      (-1..1).includes?(point.y - @origin.y) &&
      point != @origin
    end
  end
end
