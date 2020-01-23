class Author < ApplicationRecord
  validates :name, uniqueness: true

  def name=(value)
    super value.squish
  end

  def name
    Name.new(super)
  end
end
