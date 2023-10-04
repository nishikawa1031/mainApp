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
  enum :status, { draft: 0, published: 1, archived: 2, trashed: 3 }
  enum :subject, {
    civil_law: 0,
    constitution: 1,
    criminal_law: 2,
    civil_procedure_law: 3,
    criminal_procedure_law: 4,
    administrative_law: 5,
    company_law: 6,
    labor_law: 7,
    intellectual_property_law: 8,
    tax_law: 9,
    bankruptcy_law: 10,
    economic_law: 11,
    private_international_law: 12,
    public_international_law: 13,
    environmental_law: 14,
    others: 15
  }
  belongs_to :user
  has_many :category_articles
  has_many :categories, through: :category_articles

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
