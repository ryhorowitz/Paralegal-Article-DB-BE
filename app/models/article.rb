class Article < ActiveRecord::Base
  belongs_to :country
  belongs_to :category
end