class Book < ApplicationRecord
     # Validation rules
  validates :title, presence: true
  validates :author, presence: true
  validates :publication_year, presence: true, numericality: { only_integer: true }

  # Display formatted information about the book
  def display_info
    "#{title} by #{author}, #{publication_year}"
  end
end
