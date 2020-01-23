class Author < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, presence: true

  def name=(value)
    super value&.squish
  end

  def name
    Name.new(super) if super.present?
  end
end
