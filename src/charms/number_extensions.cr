struct Number
  def rad_to_deg
    self * 180 / Math::PI
  end

  def deg_to_rad
    self * Math::PI / 180
  end
end
