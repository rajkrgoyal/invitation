# frozen_string_literal: true

class SendReferralMailer < ApplicationMailer
  def send_email(to, params = {})
    @params = params
    mail(to: to, subject: 'Referral Email')
  end
end
