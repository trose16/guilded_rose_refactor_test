require_relative 'item.rb'

class GildedRose

  MIN_QUALITY = 0
  MAX_QUALITY = 50
  QUALITY_INCREMENT = 1
  SELL_BY_DATE_DECREASE = 1

  attr_accessor :items

  def initialize(items)
    @items = items
  end

  def new_update_quality
    items.each do |item|
      if item.name == "Aged Brie"
        aged_brie_quality(item)
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        backstage_pass_quality(item)
      elsif item.name == "Sulfuras, Hand of Ragnaros"
        sulfuras_quality(item)
      else
        regular_item_quality(item)
      end
    end
  end

  def regular_item_quality(item)
    puts "Regular Item"
    if item.quality > MINIMUM_QUALITY
      item.quality = item.quality - QUALITY_INCREMENT
      decrease_sell_by_date(item)
    end
  end

  def decrease_sell_by_date(item)
    if item.name != "Sulfuras, Hand of Ragnaros"
      item.sell_in = item.sell_in - SELL_BY_DATE_DECREASE
    end
  end

  def sulfuras_quality(item)
    puts "Sulfuras doesn't decrease in quality or sell by date"
  end

  def aged_brie_quality(item)
    puts "Aged Brie"
    if item.quality < MAX_QUALITY
      item.quality = item.quality + QUALITY_INCREMENT
      decrease_sell_by_date(item)
    end
  end

  def backstage_pass_quality(item)
    puts "Backstage Pass Item"
      decrease_sell_by_date(item)
      if item.quality < MAX_QUALITY && item.sell_in >= 10
        item.quality = item.quality + QUALITY_INCREMENT
      elsif item.quality < MAX_QUALITY && item.sell_in <= 10
        item.quality = item.quality + QUALITY_INCREMENT * 2
      elsif item.quality < MAX_QUALITY && item.sell_in < 5
        item.quality = item.quality + QUALITY_INCREMENT * 3
      elsif item.quality < MAX_QUALITY && item.sell_in < 0
        item.quality = MIN_QUALITY
      end
  end

  def negative_quality(item)
    if item.quality < MIN_QUALITY
      raise "Quality value can not be a negative number!"
    end
  end

  def quality_score_limit(item)
    if item.quality > MAX_QUALITY
      raise "Quality value must not exceed 50!"
    end
  end


  def past_sell_by_date

  end


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
          if item.quality < 50 #aged brie
            item.quality = item.quality + 1
          end
        end
      end
    end
  end
end
