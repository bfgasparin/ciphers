addpath('/vagrant/src/util');
addpath('/vagrant/src/exp4');
addpath('/vagrant/src/corposFinitosUtil');

poliIrredutiveis = irredutiveisGF(2, 4);
poliIrredutivel = poliIrredutiveis(3,:);

sbox = getSBox(2, 4, poliIrredutivel);
sbox
