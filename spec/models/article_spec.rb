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
require 'rails_helper'

RSpec.describe Article, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
