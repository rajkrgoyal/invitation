# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      email = Base64.decode64(params['user']['referred_by'].to_s)
      user = User.find_by(email: email)
      referral = user&.referrals&.find_by(email: resource.email)
      referral&.update(status: :accepted)
    end
  end
end
