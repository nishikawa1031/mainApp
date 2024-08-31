# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:rolable).optional(true) }
    it { is_expected.to have_many(:articles) }
    it { is_expected.to have_one_attached(:avatar) }
  end

  describe 'enums' do
    it { is_expected.to define_enum_for(:role).with_values(applicant: 0, admin: 1, employee: 2) }
  end

  describe 'callbacks' do
    context 'when role is applicant' do
      it 'creates an associated applicant after create' do
        user = build(:user, role: :applicant)
        expect { user.save }.to change(Applicant, :count).by(1)
        expect(user.rolable).to be_an(Applicant)
      end
    end

    context 'when role is not applicant' do
      it 'does not create an associated applicant after create' do
        user = build(:user, role: :employee)
        expect { user.save }.not_to change(Applicant, :count)
      end
    end
  end

  describe '.find_or_create_from_auth' do
    let(:auth_hash) do
      double(
        info: double(
          email: 'test@example.com',
          nickname: 'testuser',
          is_admin: false,
          is_employee: true
        )
      )
    end

    context 'when user does not exist' do
      it 'creates a new user' do
        expect do
          User.find_or_create_from_auth(auth_hash)
        end.to change(User, :count).by(1)
      end

      it 'sets correct attributes' do
        user = User.find_or_create_from_auth(auth_hash)
        expect(user.email).to eq('test@example.com')
        expect(user.username).to eq('testuser')
        expect(user.role).to eq('employee')
        expect(user.rolable_type).to eq('Employee')
      end
    end

    context 'when user already exists' do
      let!(:existing_user) { create(:user, email: 'test@example.com') }

      it 'does not create a new user' do
        expect do
          User.find_or_create_from_auth(auth_hash)
        end.not_to change(User, :count)
      end

      it 'updates user attributes' do
        user = User.find_or_create_from_auth(auth_hash)
        expect(user.username).to eq('testuser')
        expect(user.role).to eq('employee')
        expect(user.rolable_type).to eq('Employee')
      end
    end
  end

  describe '.determine_role' do
    it 'returns admin when is_admin is true' do
      auth_hash = double(info: double(is_admin: true, is_employee: false))
      expect(User.send(:determine_role, auth_hash)).to eq('admin')
    end

    it 'returns employee when is_employee is true' do
      auth_hash = double(info: double(is_admin: false, is_employee: true))
      expect(User.send(:determine_role, auth_hash)).to eq('employee')
    end

    it 'returns applicant when both is_admin and is_employee are false' do
      auth_hash = double(info: double(is_admin: false, is_employee: false))
      expect(User.send(:determine_role, auth_hash)).to eq('applicant')
    end
  end

  describe '.determine_rolable_type' do
    it 'returns Employee for employee role' do
      auth_hash = double(info: double(is_admin: false, is_employee: true))
      expect(User.send(:determine_rolable_type, auth_hash)).to eq('Employee')
    end

    it 'returns Applicant for non-employee roles' do
      auth_hash = double(info: double(is_admin: false, is_employee: false))
      expect(User.send(:determine_rolable_type, auth_hash)).to eq('Applicant')
    end
  end
end
