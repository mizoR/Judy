#!/usr/bin/env ruby
VAGRANTFILE_API_VERSION = '2'

vm_name = 'judy001'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'bento/centos-7.2'

  config.vm.define vm_name, primary: true do |node|
    # Patch for https://github.com/mitchellh/vagrant/issues/6793
    node.vm.provision "shell" do |shell|
      shell.inline = '[[ ! -f $1 ]] || grep -F -q "$2" $1 || sed -i "/__main__/a \\    $2" $1'
      shell.args = ['/usr/bin/ansible-galaxy', "if sys.argv == ['/usr/bin/ansible-galaxy', '--help']: sys.argv.insert(1, 'info')"]
    end

    node.vm.provision 'ansible_local' do |ansible|
      ansible.playbook = 'provisioning/site.yml'
      ansible.groups   = { targets: [vm_name] }
      ansible.install  = true
      ansible.version  = 'latest'
    end
  end
end
