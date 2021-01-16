module BookStore
  module Entities
    class Book < Grape::Entity
      # while having an actual list of books returned in file books, 
      # here we describe what exactly we want to return within each book: isbn, title and stock, other columns won't be returned
      expose :isbn
      expose :title
      expose :stock
      expose :flows, using: BookStore::Entities::Flow
    end
  end
end