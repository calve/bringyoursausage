class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable

  has_many :barbecues
  has_many :activities
  has_many :supplies
  has_many :provided_supply, :through => :supply

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.name = data["name"] if user.name.blank?
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def annex_and_destroy!(guest)
    transaction do
      #skip_confirmation_notification!

      guest.activities.each do |activity|
        activity.user = self
        activity.save
      end
      guest.barbecues.each do |barbecue|
        barbecue.user = self
        barbecue.save
      end
      guest.supplies.each do |supply|
        supply.user = self
        supply.save
      end
      guest.delete
      self.save!
    end

    self
  end
end
