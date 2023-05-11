# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %i[admin referral]

  has_many :referrals

  after_initialize :set_default_role, if: :new_record?

  private

  def set_default_role
    self.role ||= :referral
  end
end
