class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(auth)
      Admin.where(email: auth.info.email, full_name: auth.info.full_name).first
  end

end
