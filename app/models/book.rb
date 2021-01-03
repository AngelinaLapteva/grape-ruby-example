class Book < ApplicationRecord
  has_many :flows, class_name: 'Flow'
end
