class User
  module Confirmable
    extend ActiveSupport::Concern
    included do
      field :confirmation_token,   type: String
      field :confirmed_at,         type: Time
      field :confirmation_sent_at, type: Time
      field :unconfirmed_email,    type: String # Only if using reconfirmable
    end
  end
end
