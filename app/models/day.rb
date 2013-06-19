class Day
  include Mongoid::Document
  include Mongoid::Timestamps

  field :date,   type: Date
  field :text,   type: String
  field :ticked, type: Mongoid::Boolean

  belongs_to :user

  index({ user_id: 1 }, { unique: true })

  default_scope ->{ order_by date: :desc }
end
