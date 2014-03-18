require 'spec_helper'
require './heroes/superman'

describe Superman do

  it "can fly" do
    subject.can_fly?.should be_true
  end

  it "has a secret identity" do
    subject.secret_identity.should eq "Clark Kent"
  end

  it "has a description" do
    subject.description.should eq "The Man Of Steel"
  end

  describe "#introduction" do
    describe "when undercover" do
      it "uses his secret identity" do
        subject.go_undercover!
        subject.introduction.should eq "Hi, I'm #{subject.secret_identity}"
      end
    end
    describe "when fighting crime" do
      it "uses his real description" do
        subject.fight_crime!
        subject.introduction.should eq "Hi, I'm #{subject.description}"
      end
    end 
  end

  describe "#weak_to?" do
    it "is true for :kryptonite" do
      subject.weak_to?(:krytonite).should be_true
    end
    it "is false for anything else" do
      subject.weak_to?(:pasta).should be_false
    end
  end

  describe "#possesions" do
    it "includes a pair of glasses" do
      subject.possesions.should include(:pair_of_glasses)
    end

    it "includes a Justice League membership card" do
      subject.possesions.should include(:justice_league_membership_card)
    end
  end

end
