VAGRANTFILE_API_VERSION = "2"
BASE_BOX = "ubuntu/bionic64"

CODE_DIR_ON_HOST = "./"
CODE_DIR_ON_VM = "/home/vagrant/shared"

DOMAIN = "vbox.local.dev"

VIRTUAL_MACHINES = [
  { :hostname => "vm03.#{DOMAIN}",
    :ip => "192.168.100.103",
    :box => BASE_BOX,
    :ram => 1024 }
]

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  VIRTUAL_MACHINES.each do |node|
    config.vm.define node[:hostname] do |node_config|
      node_config.vm.box = node[:box]
      node_config.vm.hostname = node[:hostname]
      node_config.vm.network :private_network, ip: node[:ip]
      node_config.vm.synced_folder CODE_DIR_ON_HOST, CODE_DIR_ON_VM
      memory = node[:ram] ? node[:ram] : 512;
      node_config.vm.provider :virtualbox do |vb|
        vb.customize [
          "modifyvm", :id,
          "--memory", memory.to_s,
        ]
      end
    end
  end
  # config.vbguest.no_remote = true
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  config.vm.provision :shell, path: "bootstrap.sh"
  # config.vm.provision :shell, privileged: true, path: "install-mysql-apache-php-drupal7.sh"
end

# vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
