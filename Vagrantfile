# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "hashicorp/precise32"

  # the Hostname
  config.vm.hostname = "cyphers"

  # Provisioning with shell script
  config.vm.provision "shell", path: "Resources/scripts/bootstrap.sh"

  config.vm.provider "virtualbox" do |v|
     v.memory = 3072
     v.cpus = 4;
  end

end
