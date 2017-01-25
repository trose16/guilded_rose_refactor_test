require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do

    context "regular items that decrease in quality with age" do

      it "does not change the name" do
        items = [Item.new("banana", 0, 0)]
        GildedRose.new(items).update_quality
        expect(items[0].name).to eq "banana"
      end

      it "lowers the quality value for each item at end of day" do
          milk = [Item.new("milk", 11, 35)]
          GildedRose.new(milk).update_quality
          expect(milk[0].quality).to eq 34
      end

      it "lowers the sell by date for each item at end of day " do
        milk = [Item.new("milk", 11, 35)]
        GildedRose.new(milk).update_quality
        expect(milk[0].sell_in).to eq 10
      end

      it "decreases item's quality twice as fast after sell by date" do
        milk = [Item.new("milk", 0, 35)]
        GildedRose.new(milk).update_quality
        expect(milk[0].quality).to eq 33
      end

    end

    context "should throw an error when" do

      it "has a negative quality value " do
        milk = [Item.new("milk", 7, -5)]
        GildedRose.new(milk).update_quality
        expect { milk[0].quality }.to raise_error "Quality value is a negative number!"
      end


      it "has quality value to be greater than 50" do
        milk = [Item.new("milk", 7, 55)]
        GildedRose.new(milk).update_quality
        expect { milk[0].quality }.to raise_error "Quality value is above 50!"
      end

    end


    context "special items don't degrade with age" do

      it "increases quality of Aged Brie as it ages" do
        aged_brie = [Item.new("Aged Brie", 11, 35)]
        GildedRose.new(aged_brie).update_quality
        expect(aged_brie[0].quality).to eq 36
      end

      it "doesn't decrease sell by or quality values for Sulfuras" do
        ###
      end

      it "increases backstage pass quality value by 2 when sell by date < 10" do

      end

      it "increases backstage pass quality value by 3 when sell by date < 5" do

      end

      it "sets quality value to 0 when sell by date is == 0" do

      end

    end

  end

end
