# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :first_name, :last_name, :password, presence: true
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }

  has_secure_password
end
