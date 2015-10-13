class User < ActiveRecord::Base

  attr_accessor :password
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  has_attached_file :image, styles: { large: "600X600>", medium: "300x300#", thumb: "150x150#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, self.password_salt)
    end
  end
end
