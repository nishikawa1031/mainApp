# frozen_string_literal: true

require 'rails_helper'
require 'cancan/matchers'

# Assuming your user model has an `admin?` and `employee?` method
describe Ability do
  subject(:ability) { described_class.new(user) }

  context 'when the user is not logged in' do
    let(:user) { nil }

    it 'can read Articles' do
      expect(ability).to be_able_to(:read, Article)
    end

    it 'cannot read Applicants' do
      expect(ability).not_to be_able_to(:read, Applicant)
    end

    it 'cannot manage any resource' do
      expect(ability).not_to be_able_to(:manage, Article)
      expect(ability).not_to be_able_to(:access, :rails_admin)
      expect(ability).not_to be_able_to(:manage, :all)
    end
  end

  context 'when the user is an admin' do
    let(:user) { create(:user, :admin) }

    it 'can manage all resources' do
      expect(ability).to be_able_to(:manage, :all)
    end

    it 'can access Rails admin' do
      expect(ability).to be_able_to(:access, :rails_admin)
    end

    it 'can read Applicants' do
      expect(ability).to be_able_to(:read, Applicant)
    end
  end

  context 'when the user is an employee' do
    let(:user) { create(:user, :employee) }

    it 'can manage Articles' do
      expect(ability).to be_able_to(:manage, Article)
    end

    it 'can read Applicants' do
      expect(ability).to be_able_to(:read, Applicant)
    end

    it 'cannot access Rails admin' do
      expect(ability).not_to be_able_to(:access, :rails_admin)
    end
  end

  context 'when the user is neither an admin nor an employee' do
    let(:user) { create(:user) }

    it 'can read Articles' do
      expect(ability).to be_able_to(:read, Article)
    end

    it 'can read Applicants' do
      expect(ability).not_to be_able_to(:read, Applicant)
    end

    it 'cannot manage Articles' do
      expect(ability).not_to be_able_to(:manage, Article)
    end

    it 'cannot access Rails admin' do
      expect(ability).not_to be_able_to(:access, :rails_admin)
    end
  end
end
