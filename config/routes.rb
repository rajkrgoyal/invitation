Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root "user#index"

  post '/referrals', to: 'user#send_referral'
  put '/resend_referral/:id', to: 'user#resend_referral', as: :resend_referral
end
