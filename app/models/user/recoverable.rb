class User
  module Recoverable
    include Mongoid::Document
    field :reset_password_token,   type: String
    field :reset_password_sent_at, type: Time
  end
end

