class Image < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :path
end
