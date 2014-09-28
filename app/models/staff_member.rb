class StaffMember < ActiveRecord::Base
  include StringNormalizer


  has_many :events, class_name: 'StaffEvent', dependent: :destroy


  before_validation do
    self.email_for_index = email.downcase if email
    self.family_name = normalize_as_name(family_name)
    self.given_name = normalize_as_name(given_name)
    self.family_name_kana = normalize_as_furigana(family_name_kana)
    self.given_name_kana = normalize_as_furigana(given_name_kana)
  end

  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/

  validate :email, presence: true, email: { allow_blank: true }
  validates :family_name, :given_name, presence: true
  validates :family_name_kana, :given_name_kana, presence: true,
    format: { with: KATAKANA_REGEXP, allow_blank: true }
  validates :start_data, presence: true, date: {
    after_or_equal_to: Date.new(2001, 1, 1),
    before: -> (obj) { 1.year.from_now.to_date },
    allow_blank: true
  }
  validates :end_data, date: {
    after: :start_data,
    before: -> (obj) { 1.year.from_now.to_date },
    allow_blank: true
  }

  validates :email_for_index, uniqueness: { allow_blank: true }
  after_validation do
    if errors.include?(:email_for_index)
      errors.add(:email, :taken)
      errors.delete(:email_for_index)
    end
  end

  def password=(raw_password)
    if raw_password.kind_of?(String)
      self.hashed_password = BCrypt::Password.create(raw_password)
    elsif raw_password.nil?
      self.hashed_password = nil
    end
  end

  def active?
    !suspended? && start_data <= Date.today &&
      (end_data.nil? || end_data > Date.today)
  end

end
