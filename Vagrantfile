#!/usr/bin/env ruby
VAGRANTFILE_API_VERSION = '2'

vm_name = 'judy001'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'bento/centos-7.2'

  config.vm.define vm_name, primary: true do |node|
    node.vm.provision 'ansible_local' do |ansible|
      ansible.playbook = 'provisioning/site.yml'
      ansible.groups   = { targets: [vm_name] }
      ansible.install  = true
      ansible.version  = 'latest'
    end
  end
end
