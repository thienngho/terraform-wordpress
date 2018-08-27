VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :wp do |wp|
    wp.vm.box = 'ubuntu/xenial64'
    wp.vm.network "private_network", ip: "192.168.50.2"
  end

 config.vm.provision 'ansible' do |ansible|
   ansible.playbook = 'ansible/site.yml'
 end

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 1
  end

end
