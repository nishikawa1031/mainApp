# frozen_string_literal: true

# == Schema Information
#
# Table name: articles
#
#  id                :bigint           not null, primary key
#  body              :text
#  user_id           :bigint           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  impressions_count :integer          default(0)
#  start_time        :datetime
#  end_time          :datetime
#
class Article < ApplicationRecord
  belongs_to :user
  has_many :applicant_articles
  has_many :applicant, through: :applicant_articles

  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :category_articles
  has_many :categories, through: :category_articles, dependent: :destroy

  is_impressionable counter_cache: true, unique: true
  has_one_attached :file

  accepts_nested_attributes_for :applicant, reject_if: :all_blank, allow_destroy: true

  def liked_by?(user)
    likes.where(user_id: user).exists?
  end

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end
end
