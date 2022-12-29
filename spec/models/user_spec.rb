# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(username: 'ExampleUser', email: 'user@example.com', password: "password") }

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
    end
  end
end
