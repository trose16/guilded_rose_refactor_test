require_relative 'item.rb'


class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      #^^items come in as an array this is the iteration

      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > 0
          if item.name != "Sulfuras, Hand of Ragnaros"
            item.quality = item.quality - 1 #Items that aren't backstage passes such as brie degrade in quality
          end
        end
        # ^^ if item is not named 'aged brie' or 'Backstage passes to a TAFKAL80ETC concert' & if the item quality is greater than 0 & if the item name is not Sulfuras, Hand of Ragnaros, than the item's quality score should subtract 1

      else


        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
        # ^^ else if the item's quality is less than 50 add 1 to the item's quality score. If the item's name is equal to "Backstage passes to a TAFKAL80ETC concert" and if the sell_in days are less than 11 & if item quality is less than 50 add 1 to the items quality

            if item.sell_in < 6 # Backstage pass item increases in quality up to 50 the closer its sell by date gets
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
        # ^^ if item must be sold in less than 6 days and the item's initial quality is less than 50 add 1 to the item's quality score

          end
        end
      end
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end
      # ^^ if item's name is not "Sulfuras, Hand of Ragnaros" subtract 1 from the initial days we have to sell the item.

      if item.sell_in < 0 # passed sell by date item degrades twice as fast
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
                item.quality = item.quality - 1
              end
            end
        # ^^ if item is not named 'Aged Brie' or 'Backstage passes to a TAFKAL80ETC concert' & if the item quality is greater than 0 & if the item's name is not "Sulfuras, Hand of Ragnaros" subtract 1 from the item's initial quality score

          else
            item.quality = item.quality - item.quality
          end
        # ^^ else set the item's quality equal to the initial quality value subtracted by the same value

        else
          if item.quality < 50
            item.quality = item.quality + 1
          end

        # ^^ else if the item's quality is less than 50 add 1 to item's quality

        end
      end
    end
  end
end
