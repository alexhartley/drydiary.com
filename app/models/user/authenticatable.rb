class User
  module Authenticatable
    include Mongoid::Document
    field :email,              type: String, default: ""
    field :encrypted_password, type: String, default: ""
  end
end
