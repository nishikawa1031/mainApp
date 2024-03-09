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
#  file              :string
#  start_time        :datetime
#  end_time          :datetime
#
class Article < ApplicationRecord
  belongs_to :user
  has_many :applicant_articles
  has_many :people, through: :applicant_articles

  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy

  is_impressionable counter_cache: true, unique: true
  has_one_attached :file

  accepts_nested_attributes_for :people, reject_if: :all_blank, allow_destroy: true

  def liked_by?(user)
    likes.where(user_id: user).exists?
  end

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end
end
