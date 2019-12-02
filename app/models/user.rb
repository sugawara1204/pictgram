class User < ApplicationRecord
  validates :name, presence: true,length: { maximum: 15 }
  has_secure_password
  # パスワードをアルファベット、数字の混合のみ可能にしてください
  PW_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/i
  validates :password, presence: true, format: { with: PW_REGEX }
  validates :email, presence: true, format: { with: /[A-Za-z0-9._+]+@[A-Za-z]+.[A-Za-z]/ }
end