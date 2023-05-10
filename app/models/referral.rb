class Referral < ApplicationRecord
  belongs_to :user

  enum status: [:pending, :accepted]
  validates :email, uniqueness: { scope: :user_id }
  validates :resend_count, numericality: { less_than_or_equal_to: 5 }

end
