# -*- mode: ruby -*-
# vim: set ft=ruby :

Vagrant.configure(2) do |config|
  # образ системы centos 7
  config.vm.box = "centos/7"

  # ПЕРВАЯ ВИРТУАЛЬНАЯ МАШИНА
  config.vm.define "server" do |subconfig|
    # имя виртуальной машины
    subconfig.vm.provider "virtualbox" do |vb|
      vb.name = "server"
    end
    # hostname виртуальной машины
    subconfig.vm.hostname = "server"
    # настройки сети
    subconfig.vm.network "private_network", ip: "192.168.11.100"
    # shell
     subconfig.vm.provision "shell", inline: <<-SHELL
       mkdir -p ~root/.ssh; cp ~vagrant/.ssh/auth* ~root/.ssh
       sed -i '65s/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
       systemctl restart sshd
     SHELL
     
    subconfig.vm.provision "file", source: "files/test_login.sh", destination: "$HOME/test_login.sh"
    subconfig.vm.provision "shell", path: "files/server.sh"
    

  end
  
end