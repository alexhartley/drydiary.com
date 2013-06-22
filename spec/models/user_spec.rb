require 'spec_helper'

describe User do

  describe "#preferred_pronoun" do

    it "returns the user's custom pronoun if they have entered one" do
      User.new(custom_pronoun: 'zir').preferred_pronoun.should eq 'zir'
    end

    it "returns the selected pronoun if they have not chosen a custom one" do
      User.new(pronoun: 'their', custom_pronoun: '').preferred_pronoun.should eq 'their'
    end

  end

end
