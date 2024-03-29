# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BookSerializer, type: :service do
  let(:book1) do
    create(:book)
  end
  let(:book2) do
    create(:book, author_name: 'A. A. Milne', title: 'Winnie the Pooh')
  end

  let(:expected_serialized_result) do
    {
      data: array_including(
        a_hash_including(
          type: 'books',
          id: be_an_instance_of(String),
          attributes: a_hash_including(
            author_name: be_an_instance_of(String),
            title: be_an_instance_of(String),
            description: be_an_instance_of(String),
            rating: be_an_instance_of(Integer).or(be_nil),
            word_count: be_an_instance_of(Integer).or(be_nil)
          )
        )
      )
    }
  end

  let(:meta_result) do
    {
      meta:
        a_hash_including(
          status: be_an_instance_of(String),
          message: be_an_instance_of(String)
        )
    }
  end

  subject(:serialized_result) { BookSerializer.serialize(books) }

  context 'serialization of book' do
    let(:books) { [book1, book2] }

    it 'returns serialized books with correct structure' do
      expect(serialized_result).to include(expected_serialized_result)
    end

    it 'returns serialized books with correct meta message' do
      expect(serialized_result).to include(meta_result)
    end
  end

  context 'return of no books' do
    let(:books) { [] }

    it 'returns nil when there are no books' do
      expect(serialized_result).to be_nil
    end
  end

  context 'when there is only 1 book' do
    let(:books) { book1 }

    before do
      allow(BookSerializer).to receive(:serialize).and_raise(NoMethodError)
    end

    it 'raises a NoMethodError' do
      expect { serialized_result }.to raise_error(NoMethodError)
    end
  end
end
