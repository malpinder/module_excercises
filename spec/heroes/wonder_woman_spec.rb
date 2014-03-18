require 'spec_helper'
require './heroes/wonder_woman'

describe WonderWoman do

  it "can fly" do
    subject.can_fly?.should be_true
  end

  it "has a secret identity" do
    subject.secret_identity.should eq "Diana Prince"
  end

  it "has a description" do
    subject.description.should eq "Princess Diana of the Amazons - Wonder Woman!"
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
    it "is always false" do
      subject.weak_to?(:kryptonite).should be_false
    end
  end

  describe "#possesions" do
    it "includes a magic lasso" do
      subject.possesions.should include(:lasso_of_truth)
    end

    it "includes a Justice League membership card" do
      subject.possesions.should include(:justice_league_membership_card)
    end
  end

end
