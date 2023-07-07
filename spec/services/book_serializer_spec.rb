require "rails_helper"

RSpec.describe BookSerializer, type: :model do
  context "serialization of book" do
    let(:book1) do
      Book.create(
        author_name: "Michael Bond",
        title: "Paddington Bear",
        description: "The tale goes that he bought a small toy bear for his wife after seeing it left alone on the shelves of Selfridges one evening. He named him Paddington after the train station close to his home.",
        rating: 5,
        word_count: 500
      )
    end
    let(:book2) do
      Book.create(
        author_name: "A. A. Milne",
        title: "Winnie the Pooh",
        description: "The main character, Winnie-the-Pooh (sometimes called simply Pooh or Edward Bear), is a good-natured, yellow-furred, honey-loving bear who lives in the Forest surrounding the Hundred Acre Wood ",
        rating: 4,
        word_count: 600
      )
    end

    let(:books) { [book1, book2] }

    it "returns serialized books" do
      serialized_result = BookSerializer.serialize(books)
      puts "Here is the class: #{serialized_result.class}"
      expect(serialized_result).to eq({
        data: [
          {
            type: "books",
            id: "1",
            attributes: {
              author_name: book1.author_name,
              title: book1.title,
              description: book1.description,
              rating: book1.rating,
              word_count: book1.word_count
            }
          },
          {
            type: "books",
            id: "2",
            attributes: {
              author_name: book2.author_name,
              title: book2.title,
              description: book2.description,
              rating: book2.rating,
              word_count: book2.word_count
            }
          }
        ],
        meta: {
          status: "SUCCESS",
          message: "Loaded books"
        }
      })
    end
  end
end
