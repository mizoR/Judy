lock '3.4.1'

set :application,  'bot'
set :repo_url,     'git@example.com:me/my_repo.git'
set :deploy_to,    '/home/app/bot'
set :linked_files, fetch(:linked_files, []).push('.env')
set :linked_dirs,  fetch(:linked_dirs,  []).push('log', 'tmp', 'vendor/bundle')
set :scm, :copy

task :provision do
  on roles(:app) do
    provision_path = File.join(current_path, 'provisioning')
    inventry_path  = File.join(provision_path, 'bot.inventry')
    execute "cd #{provision_path} && ansible-playbook -i #{inventry_path} ./site.yml"
  end
end
