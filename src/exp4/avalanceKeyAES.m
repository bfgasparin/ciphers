addpath('/vagrant/src/cipher');
addpath('/vagrant/src/util');

C = AESE('text', 'key');

disp(C);