class User < ApplicationRecord
  validates :name, presence: true,length: { maximum: 15 }
  validates :email, presence: true

  has_secure_password
  validates :password, presence: true,length: { miniumum: 8,maximum: 32 }
  
  mailRegex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  email = "a@a.com"
  email.match? mailRegex
  /\A[a-z\d]{8,100}+\z/i
end