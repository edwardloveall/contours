class Contours::PointGrouper
  @points = [] of Point

  def self.group(points : Array(Point))
    new(points: points).group
  end

  def initialize(points : Array(Point))
    @points = points.clone
  end

  def group : Array(Array(Point))
    groups = [] of Array(Point)
    while !@points.empty?
      start_point = @points.shift
      groups.push(find_neighbors(start_point) + [start_point])
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
