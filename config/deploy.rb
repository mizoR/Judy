lock '3.4.1'

set :application,  'judy'
set :repo_url,     'git@github.com:mizoR/Judy.git'
set :deploy_to,    '/home/app/judy'
set :linked_files, fetch(:linked_files, []).push('.env')
set :linked_dirs,  fetch(:linked_dirs,  []).push('log', 'tmp', 'vendor/bundle')
set :scm,          :copy


desc 'Run provision'
task :provision do
  on roles(:app) do
    provision_path = File.join(current_path, 'provisioning')
    inventry_path  = File.join(provision_path, 'judy.inventry')
    execute "cd #{provision_path} && ansible-playbook -i #{inventry_path} ./site.yml"
  end
end

namespace :deploy do
  def define_deploy_task(command)
    task command do
      invoke "judy:#{command}"
    end
  end

  %i(start stop restart status).each do |command|
    define_deploy_task(command)
  end
end

before 'deploy:check:linked_files', 'config:push'
