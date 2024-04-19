class Employee < ApplicationRecord
  has_one :user, as: :rolable
  has_one :company
end
