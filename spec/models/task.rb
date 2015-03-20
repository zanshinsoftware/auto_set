class Task < ActiveRecord::Base
  auto_set :project, :group

  belongs_to :group
  belongs_to :project
end
