class Employee < ApplicationRecord
  has_one :user, as: :rolable

end
