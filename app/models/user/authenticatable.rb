class User
  module Authenticatable
    extend ActiveSupport::Concern
    included do
      field :email,              type: String, default: ""
      field :encrypted_password, type: String, default: ""
    end
  end
end
