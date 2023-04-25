class Article < ActiveRecord::Base
  belongs_to :countries
  belongs_to :categories
end