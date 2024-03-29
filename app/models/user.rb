class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :products

  before_save { |user| user.email = email.downcase }

  #has_secure_password

  validates :username, presence: true, length: { maximum: 50 }
  validates :email, presence:   true,
            format:     { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def feed
    products
  end

  #def User.new_remember_token
  #  SecureRandom.urlsafe_base64
  #end
  #
  #def User.encrypt(token)
  #  Digest::SHA1.hexdigest(token.to_s)
  #end
  #
  #private
  #def create_remember_token
  #  self.remember_token = User.encrypt(User.new_remember_token)
  #end

end
