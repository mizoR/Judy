lock '3.4.1'

set :application,  'bot'
set :repo_url,     'git@example.com:me/my_repo.git'
set :deploy_to,    '/home/app/bot'
set :linked_files, fetch(:linked_files, []).push('.env')
set :linked_dirs,  fetch(:linked_dirs,  []).push('log', 'tmp', 'vendor/bundle')
set :scm, :copy

task :ping do
  on roles(:all) do
    execute "echo pong"
  end
end
