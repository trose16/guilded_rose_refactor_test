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

  def update_quality
    items.each do |item|
      quality_score_control(item)
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

  def quality_score_control(item)
    if item.quality > MAX_QUALITY
      quality_score_limit(item)
    elsif item.quality < MIN_QUALITY
      quality_score_minimum(item)
    end
  end

  def quality_score_minimum(item)
    raise "Quality value can not be a negative number!"
  end

  def quality_score_limit(item)
    raise "Quality value must not exceed 50!"
  end

  def regular_item_quality(item)
    puts "Regular Item"
    if item.quality > MIN_QUALITY
      item.quality = item.quality - QUALITY_INCREMENT
      decrease_sell_by_date(item)
    end
  end

  def decrease_sell_by_date(item)
      item.sell_in = item.sell_in - SELL_BY_DATE_DECREASE
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
