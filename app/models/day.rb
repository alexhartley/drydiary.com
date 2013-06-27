class Day
  include Mongoid::Document
  include Mongoid::Timestamps

  field :date,   type: Date
  field :text,   type: String
  field :ticked, type: Mongoid::Boolean, default: false

  belongs_to :user

  validates_uniqueness_of :date, scope: :user_id

  index({ date: 1, user_id: 1 }, { unique: true })

  default_scope ->{ order_by date: :desc }

  scope :successful, -> {
    where(date: { "$ne" => Date.today }, ticked: true)
  }

end
