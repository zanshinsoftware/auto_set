class Task < ActiveRecord::Base
  auto_set :project, :group, before: :create

  belongs_to :group
  belongs_to :project
end
