ActiveRecord::Migration.create_table :projects do |t|
  t.string :title
  t.string :code
end

ActiveRecord::Migration.create_table :groups do |t|
  t.string :title
  t.references :project
  t.string :project_code
end

ActiveRecord::Migration.create_table :tasks do |t|
  t.string :content
  t.references :group
  t.references :project
end
