class BackstageUpdate < ItemUpdate
  def update_quality
    if sell_in < 0
      self.quality = 0
    elsif sell_in < 5
      increment_quality(3)
    elsif sell_in < 10
      increment_quality(2)
    else
      increment_quality
    end
  end
end
