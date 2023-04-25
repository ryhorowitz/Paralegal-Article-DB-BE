class Country < ActiveRecord::Base
  has_many :articles
end