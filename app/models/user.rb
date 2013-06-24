require 'consecutive_days_calculator'

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  # Include default devise modules. Others available are:
  # :token_authenticatable, 
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time

  ## Token authenticatable
  # field :authentication_token, type: String
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable

  field :username,         type: String
  field :pronoun,          type: String, default: 'their'
  field :custom_pronoun,   type: String
  field :addiction,        type: String

  has_many :days

  validates_presence_of :username, :addiction
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
