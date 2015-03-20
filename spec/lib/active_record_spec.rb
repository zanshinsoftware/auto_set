require 'spec_helper'
require 'models/project'
require 'models/group'
require 'models/task'

describe AutoSet do
  before :all do
    @project = Project.create title: 'My Awesome Project', code: 'proj1'

    @group_1 = Group.create title: 'My Group', project_code: 'proj1'
    @task = @group_1.tasks.create content: 'Write awesome documentation'

    @group_2 = @project.groups.create title: 'Second Group'
  end

  describe 'parent' do
    it { expect(@group_1.project_id).to eq 1 }
  end

  describe 'from' do
    it { expect(@task.project_id).to eq 1 }
    it { expect(@group_2.project_code).to eq 'proj1' }
    it {
      @group_2.project = nil
      @group_2.save

      expect(@group_2.project_code).to eq nil
    }
  end
end
