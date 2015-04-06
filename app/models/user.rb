class User < ActiveRecord::Base
	after_create :send_welcome_mail

	def send_welcome_mail
		UserMailer.welcome(self).deliver_now
	end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
