class Book < ApplicationRecord
  validates :author_name, :rating, :word_count, presence: true
  validates :title, uniqueness: true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  def validate_rating(rating)
    # if below 3 raise a StandardError.
    raise StandardError, "Rating too low. Must be between 3-5" if rating <= 3
  end
end
