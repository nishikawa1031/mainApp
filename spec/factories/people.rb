# frozen_string_literal: true

# == Schema Information
#
# Table name: applicant
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  creater_id :integer          not null
#
FactoryBot.define do
  factory :person do
    name { 'MyString' }
    user_id { 1 }
  end
end
