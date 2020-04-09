require 'byebug'
require_relative './lib/item_update'
require_relative './lib/aged_update'
require_relative './lib/backstage_update'
require_relative './lib/conjured_update'
require_relative './lib/sulfuras_update'

class GildedRose
  def update_quality(items)
    items
      .map(&method(:update_for))
      .each(&:tick)
  end

  private

  def update_for(item)
    ItemUpdate.for(item)
  end
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.

# items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]
