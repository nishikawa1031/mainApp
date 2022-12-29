# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles, dependent: :destroy
  has_one_attached :avatar
  # mount_uploader :avatar, AvatarUploader

  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { maximum: 20 }, format: { with: /\A[a-zA-Z0-9]+\z/ }
end
