class User < ApplicationRecord
  has_many :playlists
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :username, presence: true, uniqueness: true
  # validates :address, presence: true
  # validates :dob, presence: true
  # validates :sex, presence: true

  attr_writer :login

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(
        ["lower(username) = :value OR lower(email) = :value", { value: login.downcase }]
      ).first
    else
      where(conditions.to_h).first
    end
  end
end
