class ItemUpdate < SimpleDelegator
  def self.for(item)
    class_name = "#{item.name.split(/\W+/).first}Update"

    if Object.const_defined?(class_name)
      Object.const_get(class_name).new(item)
    else
      new(item)
    end
  end

  def tick
    self.sell_in -= 1
    update_quality
  end

  def update_quality
    decrement_quality(sell_in.negative? ? 2 : 1)
  end

  def decrement_quality(amount = 1)
    amount.times do
      self.quality -= 1 if quality.positive?
    end
  end

  def increment_quality(amount = 1)
    amount.times do
      self.quality += 1 if quality < 50
    end
  end
end
