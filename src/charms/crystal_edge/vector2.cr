struct CrystalEdge::Vector2
  def angle_to(other : Vector2)
    (other - self).angle
  end
end
