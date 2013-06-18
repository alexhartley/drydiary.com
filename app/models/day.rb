class Day
  include Mongoid::Document
  include Mongoid::Timestamps

  field :date, type: Date
  field :text, type: String

  belongs_to :user

  default_scope ->{ order_by date: :desc }
end
