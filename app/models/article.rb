class Article < ApplicationRecord
  enum :status, { draft: 0, published: 1, archived: 2, trashed: 3 }
  belongs_to :user
end
