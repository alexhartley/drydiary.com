require 'spec_helper'

describe RegistrationsHelper do
  describe "#pronoun_options_for_select" do
    it 'returns an array of options for the pronoun select' do
      helper.pronoun_options_for_select.should be_an Array
    end
  end
end
