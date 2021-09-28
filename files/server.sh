#!/bin/bash
sudo yum install -y nano
sudo cp /home/vagrant/test_login.sh /usr/local/bin/test_login.sh
sudo useradd day && sudo useradd night && sudo useradd friday
echo "Otus2021" | sudo passwd --stdin day &&\
echo "Otus2021" | sudo passwd --stdin night &&\
echo "Otus2021" | sudo passwd --stdin friday


#sudo sed -i "s/^PasswordAuthentication.*$/PasswordAuthentication yes/" /etc/ssh/sshd_config
sudo systemctl restart sshd
sudo echo -e '*;*;day;Al0800-2000\n*;*;night;!Al0800-2000\n*;*;friday;Fr' >> /etc/security/time.conf
sudo sed  -i -E "s/account.+required.+pam_nologin.so/account    required     pam_nologin.so\naccount    required     pam_exec.so     \/usr\/local\/bin\/test-login.sh/" /etc/pam.d/sshd
for pkg in epel-release pam_script; do yum install -y $pkg; done
