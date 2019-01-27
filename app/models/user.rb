class User < ApplicationRecord
  validates :name, presence: true, length:{ maximum: 15}

  VALID_MAILADDRESS_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, presence: true , format: {with: VALID_MAILADDRESS_REGEX}

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]\z/
  validates :password, length: {in: 8..32}, format: {with: VALID_PASSWORD_REGEX}

  has_secure_password
end
