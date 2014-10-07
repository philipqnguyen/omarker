# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

task default: 'test:run'

Rake::Task['test:run'].enhance ['test:features']

Rails::TestTask.new('test:features' => 'test:prepare') do |t|
  t.pattern = 'test/**/**/**_test.rb'
end
