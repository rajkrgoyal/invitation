class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super do |resource|
      email = Base64.decode64(params['user']['referred_by'].to_s)
      user = User.find_by(email: email) rescue nil
      referral = user && user.referrals.find_by(email: resource.email)
      if referral
        referral.update(status: :accepted)
      end
    end
  end

  def update
    super
  end
end 