class Contours::PointGrouper
  @points = [] of Point

  def self.group(points : Array(Point))
    new(points: points).group
  end

  def initialize(@points : Array(Point))
  end

  def group : Array(Array(Point))
    groups = [] of Array(Point)
    while !@points.empty?
      groups.push(find_neighbors(@points.first))
    end
    groups
  end

  def find_neighbors(point : Point)
    neighbors = Contours::GridNearestNeighbors.new(
      origin: point, points: @points
    ).find

    return neighbors if neighbors.empty?

    @points -= neighbors
    neighbors.each do |point|
      neighbors += find_neighbors(point)
    end
    neighbors
  end
end
