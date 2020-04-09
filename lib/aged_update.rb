class AgedUpdate < ItemUpdate
  def update_quality
    increment_quality(sell_in.negative? ? 2 : 1)
  end
end
