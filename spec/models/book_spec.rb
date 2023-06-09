require "rails_helper"

RSpec.describe Book, type: :model do
  context "validity of Book" do
    let(:book1) do
      Book.create(
        author_name: author_name,
        title: title,
        description: description,
        rating: rating,
        word_count: word_count
      )
    end
    let(:book2) do
      Book.create(
       author_name: author_name,
        title: title,
        description: description,
        rating: rating,
        word_count: word_count
      )
    end
    let(:author_name) { "Kathleen Walsh" }
    let(:title) { "A memoir" }
    let(:description) { "The new and improved life story" }
    let(:word_count) { 250_000 }
    let(:rating) { 4 }

    it "is valid with valid attributes" do
      expect(book1).to be_valid
    end

    it "is not valid without a unique title" do
      book1
      expect(book2).to_not be_valid
    end

    context "rating not between 1-5" do
      let(:rating) { 8 }
      it "is invalid without a star rating between 1-5" do
        expect(book1).to_not be_valid
      end

      it "does not raise an exception if rating greater than 3" do
        expect { book1.validate_rating(rating) }.to_not raise_error
      end
    end

    context "rating less than or equal to 3" do
      let(:rating) { 3 }
      it "raises an exception if rating less than or equal to 3" do
        expect { book1.validate_rating(rating) }.to raise_error(StandardError)
      end
    end
  end
end
