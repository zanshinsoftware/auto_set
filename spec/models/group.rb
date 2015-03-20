class Group < ActiveRecord::Base
  auto_set :project, from: :code

  belongs_to :project
  has_many :tasks
end
