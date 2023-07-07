module Api
  module V1
    class BooksController < ApplicationController
      def index
        render json: serialized_books
      end

      private

      def serialized_books
        BookSerializer.serialize(books) # returns a json formatted string, as that is what serialization is in this context.
      end

      def books
        Book.all
      end
    end
  end
end
