class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :first_name, presence: true,  length: { maximum: 100 }
  validates :last_name, presence: true,  length: { maximum: 100 }
  validates :email, presence: true, uniqueness: true
  validates :password,  length: { in: 6..20 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  has_one :user_profile
  accepts_nested_attributes_for :user_profile
end
