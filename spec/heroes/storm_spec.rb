require 'spec_helper'
require './heroes/storm'

describe Storm do

  it "can fly" do
    subject.can_fly?.should be_true
  end

  it "has a secret identity" do
    subject.secret_identity.should eq "Ororo Munroe"
  end

  it "has a description" do
    subject.description.should eq "Storm"
  end

  describe "#introduction" do
    describe "when undercover" do
      it "uses her secret identity" do
        subject.go_undercover!
        subject.introduction.should eq "Hi, I'm #{subject.secret_identity}"
      end
    end
    describe "when fighting crime" do
      it "uses her real description" do
        subject.fight_crime!
        subject.introduction.should eq "Hi, I'm #{subject.description}"
      end
    end 
  end

  describe "#weak_to?" do
    it "is false for :psychic_powers" do
      subject.weak_to?(:psychic_powers).should be_false
    end
    it "is false for :kryptonite" do
      subject.weak_to?(:krytonite).should be_false
    end
    it "is false for lightning" do
      subject.weak_to?(:lightning).should be_false
    end
    it "is true for anything else" do
      subject.weak_to?(:pasta).should be_true
    end
  end

  describe "#possesions" do
    it "includes an X-men uniform" do
      subject.possesions.should include(:x_men_uniform)
    end

    it "includes a Justice League membership card" do
      subject.possesions.should include(:justice_league_membership_card)
    end
  end

end
