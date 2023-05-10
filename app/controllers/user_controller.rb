class UserController < ApplicationController
  def index
  end

  def send_referral
    referral = Referral.new(email: params[:email], user_id: current_user.id, status: :pending)

    if referral.save
      flash[:notice] = "Referral sent successfully."
    else
      flash[:error] = "Error sending referral."
    end
    redirect_to root_path
  end

  def resend_referral
    referral = Referral.find(params[:id])
    if current_user.admin? && referral.update(resend_count: referral.resend_count + 1)
      flash[:notice] = "Invitation has been resent to #{referral.email}."
    else
      flash[:error] = "Error resending referral."
    end
    redirect_to root_path
  end
end
