class Category < ActiveRecord::Base
  belongs_to :User
  has_many :charges
end
