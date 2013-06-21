module RegistrationsHelper

  def pronoun_options_for_select
    [
      ["her","her"],
      ["hir","hir"],
      ["his","his"],
      ["their","their"],
      ["alternative - please specify", ""]
    ]
  end
end
