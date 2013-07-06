class User
  module Rememberable
    extend ActiveSupport::Concern
    included do
      field :remember_created_at, type: Time
    end
  end
end
