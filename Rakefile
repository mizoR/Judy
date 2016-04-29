require 'rspec/core/rake_task'

namespace :provisioning do
  desc "Run serverspec tests"
  task :spec do
      sh "cd ./provisioning && bundle exec rspec spec" do |_, status|
      exit status.exitstatus if status.exitstatus
    end
  end
end
