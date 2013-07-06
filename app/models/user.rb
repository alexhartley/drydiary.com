require 'consecutive_days_calculator'

class User
  include Mongoid::Document
  include Mongoid::Timestamps

  include Authenticatable
  include Recoverable
  include Rememberable
  include Trackable
  include Confirmable

  devise(
    :database_authenticatable,
    :registerable,
    :confirmable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable
  )

  field :username,         type: String
  field :pronoun,          type: String, default: 'their'
  field :custom_pronoun,   type: String
  field :addiction,        type: String

  has_many :days

  validates_presence_of :username, :addiction
  validates :username, :exclusion => { :in => %w(users days) }
  validates_uniqueness_of :username, message: "Unfortunately that username has already been taken."
  validates_presence_of :pronoun, if: ->{ custom_pronoun.blank? }

  def consecutive_days
    @consecutive_days ||= ConsecutiveDaysCalculator.new(self).calculate
  end

  def preferred_pronoun
    Option[pronoun].reject(&:blank?).value_or custom_pronoun
  end

  def today
    days.where(date: Date.today).find_or_initialize_by
  end

end
