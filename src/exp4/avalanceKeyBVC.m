addpath('/vagrant/src/cipher');
addpath('/vagrant/src/util');
addpath('/vagrant/src/corposFinitosUtil');


nBits = 16;
nRepeticoes = 100;
nRodadas = 1;

P = rand(1,nBits)>.5; %obtem uma texto de bits aleatoria

C = BVCE(P, 'key', nRodadas);

disp(C);