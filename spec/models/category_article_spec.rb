# frozen_string_literal: true

# == Schema Information
#
# Table name: category_articles
#
#  id          :bigint           not null, primary key
#  category_id :bigint           not null
#  article_id  :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe CategoryArticle, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
