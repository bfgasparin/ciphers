ciphers
=======

Ciphers project for USP Security classes.

Vagrant
-------

This project uses [Vagrant][vagrant_url]. 

First install [Vagrant][vagrant_url] and [Virtual Box][virtual_box_url].

Boot the VM for this project:

	$ vagrant up

If its your first time, vagrant will install all packages needed to 
run the ciphers of this project (See *'Resources/script/bootstrap.sh'*).

Access the VM:
	
	$ vagrant ssh

Go to the project directory into the VM:

	$ cd /vagrant

The source files are located at *src* directory:

	$ cd src/

Now, you can run the octave files running

	$ octave <filename>


[vagrant_url]: http://www.vagrantup.com
[virtual_box_url]: https://www.virtualbox.org