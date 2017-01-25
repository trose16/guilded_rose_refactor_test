require_relative 'item.rb'


class GildedRose

  attr_reader :items

  def initialize(items)
    @items = items
  end

  def new_update_item
    items.each do |item|
      regular_item_quality if item.name != "Aged Brie" || "Backstage passes to a TAFKAL80ETC concert" || "Sulfuras, Hand of Ragnaros" 
      aged_brie_quality if item.name == "Aged Brie"
      backstage_pass_quality if item.name == "Backstage passes to a TAFKAL80ETC concert"
      sulfuras_quality if item.name == "Sulfuras, Hand of Ragnaros"
    end
  end

  def sulfuras_quality
    puts "sulfuras"
  end

  def aged_brie_quality
    puts "brie"
  end


  def regular_item_quality
    puts "regular item"
    # items.each do |item|
    #   if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
    #     if item.quality > 0
    #       if item.name != "Sulfuras, Hand of Ragnaros"
    #         item.quality = item.quality - 1
    #       end
    #     end
    #   end
    # end
  end

  def backstage_pass_quality #needs to interact with the method that reduces sell_in as well...
    puts "backstage pass"
  #   items.each do |item|
  #   if item.quality < 50
  #     item.quality = item.quality + 1
  #     if item.name == "Backstage passes to a TAFKAL80ETC concert"
  #       if item.sell_in < 11
  #         if item.quality < 50
  #           item.quality = item.quality + 1
  #         end
  #       end
  #       if item.sell_in < 6
  #         if item.quality < 50
  #           item.quality = item.quality + 1
  #         end
  #       end
  #     end
  #   end
  # end
  end

  # def decrease_sell_by_date
  #   if item.name != "Sulfuras, Hand of Ragnaros"
  #     item.sell_in = item.sell_in - 1
  #   end
  # end
  #
  # def past_sell_by_date
  #   if item.sell_in < 0
  #     if item.name != "Aged Brie"
  #       if item.name != "Backstage passes to a TAFKAL80ETC concert"
  #         if item.quality > 0
  #           if item.name != "Sulfuras, Hand of Ragnaros"
  #             item.quality = item.quality - 1
  #           end
  #         end
  #       else
  #         item.quality = item.quality - item.quality
  #       end
  #     else
  #       if item.quality < 50
  #         item.quality = item.quality + 1
  #       end
  # end


  def update_quality()
    items.each do |item|
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > 0
          if item.name != "Sulfuras, Hand of Ragnaros"
            item.quality = item.quality - 1
          end
        end
      else


        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
    end
  end
end
