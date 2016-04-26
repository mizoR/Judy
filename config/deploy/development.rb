role :app, %w{127.0.0.1:2222}, user: 'vagrant'

set :ssh_options, {
  keys: %w(./.vagrant/machines/bot001/virtualbox/private_key),
  forward_agent: false
}
