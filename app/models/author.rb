class Author < ApplicationRecord
  validates :name, uniqueness: true
end
