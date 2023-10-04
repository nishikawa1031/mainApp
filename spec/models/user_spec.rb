# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  avatar                 :string
#  username               :string           not null
#  default_color          :string           default("blue")
#
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(username: 'ExampleUser', email: 'user@example.com', password: 'password') }

  describe 'バリデーションのテスト' do
    context 'usernameカラム' do
      it '空欄でないこと' do
        user.username = ''
        expect(user).not_to be_valid
      end

      it '英数字以外を含まないこと' do
        user.username = 'あいう'
        expect(user).not_to be_valid
      end

      it '英数字以外を含まないこと' do
        user.username = 'dddd234'
        expect(user).to be_valid
      end

      it 'アンダースコアを登録できること' do
        user.username = 'dd_dd234'
        expect(user).to be_valid
      end
    end
  end
end
