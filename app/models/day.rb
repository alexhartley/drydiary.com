class Day
  include Mongoid::Document
  field :date, type: Date
  field :text, type: String

  belongs_to :user
end
