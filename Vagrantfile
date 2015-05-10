# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "uvsmtid/centos-7.0-minimal"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end
end
