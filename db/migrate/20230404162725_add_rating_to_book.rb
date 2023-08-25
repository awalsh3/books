# frozen_string_literal: true

class AddRatingToBook < ActiveRecord::Migration[7.0] # rubocop:todo Style/Documentation
  def change
    add_column :books, :rating, :integer
  end
end
