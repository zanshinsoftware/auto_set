class Group < ActiveRecord::Base
  auto_set :project, from: :code, before: :validation

  belongs_to :project
  has_many :tasks
end
