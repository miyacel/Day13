class Poem < ActiveRecord::Base
  validates :title, :content, :auther, presence: true
end
