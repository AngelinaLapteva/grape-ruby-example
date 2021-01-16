module BookStore
  module V1
    class Books < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api
      # :books is table name, check the migration to see
      resource :books do

        # /api/:version/books(.json)
        desc 'Return list of books'
        get do
          books = Book.all
          present books, with: BookStore::Entities::Index
        end

        # /api/:version/books/:id(.json)
        desc 'Return a specific book'
        route_param :id do
          get do
            book = Book.find(params[:id])
            # entities is coming from folder entities -> book.rb
            present book, with: BookStore::Entities::Book
          end

          resource :flows do
            desc 'Create a flow.'
            params do
              requires :flow, type: Hash do
                requires :newStock, type: Integer, desc: 'New Stock.'
                requires :previousStock, type: Integer, desc: 'Previous Stock.'
              end
            end
            post do
              @book = Book.find(params[:id])
              @flow = Flow.new(params[:flow])
              @flow = @book.flows.create!(params[:flow])
              @book.update(stock: @flow.newStock)
            end
          end
        end # end of return a specific book
      end
    end
  end
end