addpath('/vagrant/src/cipher');
addpath('/vagrant/src/util');

C = AES('text', 'key');

echo(C);