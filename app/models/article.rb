# frozen_string_literal: true

# == Schema Information
#
# Table name: articles
#
#  id                :bigint           not null, primary key
#  title             :string
#  body              :text
#  status            :integer          default("draft")
#  user_id           :bigint           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  comment           :text
#  impressions_count :integer          default(0)
#  file              :string
#  start_time        :datetime
#  end_time          :datetime
#
class Article < ApplicationRecord
  belongs_to :user
  has_many :person_articles
  has_many :persons, through: :person_articles

  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy

  is_impressionable counter_cache: true, unique: true
  has_one_attached :file

  YEARS = %w[
    2022 2021 2020 2019 2018 2017 2016 2015 2014 2013 2012 2011 2010 2009 2008 2007 2006 2005 2004 2003 2002 2001 2000 1999 1998 1997 1996 1995 1994 1993 1992 1991 1990 1989 1988 1987 1986 1985 1984 1983 1982 1981 1980 1979
  ]

  Colors = %w[blue indigo purple pink red orange yellow green teal cyan gray].freeze

  def liked_by?(user)
    likes.where(user_id: user).exists?
  end

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end
end
