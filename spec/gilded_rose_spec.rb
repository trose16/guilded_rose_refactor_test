require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do

    let( :items ) { double [described_class.new("banana", 11, 30)] }

    it "does not change the name" do
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "banana"
    end

    it "lowers the quality value for each item at end of day" do
      ###
    end

    it "lowers the sell by date for each item at end of day " do
      ###
    end

    it "decreases item's quality twice as fast after sell by date" do
      ###
    end

    it "doesn't allow a negative quality value " do
      ###
    end


    it "doesn't allow a quality value to be greater than 50" do
      ###
    end

    it "doesn't decrease sell by or quality values for Sulfuras" do
      ###
    end

    it "increases quality of Aged Brie as it ages" do
      ###
    end

    context "Backstage passes increase in quality with age" do

      it "increases quality value by 2 when sell by date < 10" do

      end

      it "increases quality value by 3 when sell by date < 5" do

      end

      it "sets quality value to 0 when sell by date is == 0" do

      end

    end

  end

end
