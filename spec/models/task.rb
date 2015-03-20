class Task < ActiveRecord::Base
  auto_set :project, through: :group

  belongs_to :group
  belongs_to :project
end
