#!/usr/bin/env ruby
VAGRANTFILE_API_VERSION = '2'

bot_server = 'bot001'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'bento/centos-7.2'

  config.vm.define bot_server, primary: true do |node|
    # Patch for https://github.com/mitchellh/vagrant/issues/6793
    config.vm.provision "shell" do |s|
      s.inline = '[[ ! -f $1 ]] || grep -F -q "$2" $1 || sed -i "/__main__/a \\    $2" $1'
      s.args = ['/usr/bin/ansible-galaxy', "if sys.argv == ['/usr/bin/ansible-galaxy', '--help']: sys.argv.insert(1, 'info')"]
    end

    node.vm.provision 'ansible_local' do |ansible|
      ansible.playbook = 'provisioning/site.yml'
      ansible.groups   = { targets: [bot_server] }
      ansible.install  = true
      ansible.version  = '2.0.1.0'
    end
  end
end
