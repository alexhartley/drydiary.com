require 'spec_helper'

describe User do

  describe "#preferred_pronoun" do

    it "returns the user's custom pronoun if they have not selected one from the list" do
      User.new(pronoun: '', custom_pronoun: 'zir').preferred_pronoun.should eq 'zir'
    end

    it "returns the selected pronoun if they have chosen one" do
      User.new(pronoun: 'their', custom_pronoun: 'zir').preferred_pronoun.should eq 'their'
    end

  end

  describe "#tally" do
    it 'delegates to the tally calculator' do
      user = User.new
      Tally.should_receive(:new).with(user).and_return(stub(calculate: 4))
      user.tally.should eq 4
    end
  end

end
