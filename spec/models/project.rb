class Project < ActiveRecord::Base
  has_many :groups
  has_many :tasks
end