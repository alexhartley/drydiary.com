class User
  module Recoverable
    extend ActiveSupport::Concern
    included do
      field :reset_password_token,   type: String
      field :reset_password_sent_at, type: Time
    end
  end
end
