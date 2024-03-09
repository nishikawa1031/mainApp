# frozen_string_literal: true

# == Schema Information
#
# Table name: people
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  creater_id :integer          not null
#
class Applicant < ApplicationRecord
  has_many :applicant_articles
  has_many :articles, through: :applicant_articles
end
