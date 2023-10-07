# frozen_string_literal: true

# == Schema Information
#
# Table name: person_articles
#
#  id         :bigint           not null, primary key
#  person_id  :bigint           not null
#  article_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe PersonArticle, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
