class Author < ApplicationRecord
  validates :name, uniqueness: true

  def name
    Name.new(super)
  end
end
