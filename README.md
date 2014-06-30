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

To run the octave files, execute:

	$ octave -p src/ src/<filename>

For the experiences 3 and 4, you must execute the following scripts:

1 - For key avalanche:

	$ octave -p src/ src/exp3/avalancheKeyFeistel.m  
	$ octave -p src/ src/exp4/avalanceKeyBVC.m 

2 - For plain text avalanche:

	$ octave -p src/ src/exp3/avalanchePlainFeistel.m 
	$ octave -p src/ src/exp4/avalanchePlainBVC.m 

**Obs:** For the diferent tests for expecience 3, we changed the variables in 
avalanche*Feistel.m, like key length, and we swhitched the roundKey 
between shifting the key or applying bit a bit mod in the 
'src/cipher/feistel.m'. 

[vagrant_url]: http://www.vagrantup.com
[virtual_box_url]: https://www.virtualbox.org