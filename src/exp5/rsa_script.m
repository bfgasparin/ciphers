addpath('/vagrant/src/util');
addpath('/vagrant/src/corposFinitosUtil');
addpath('/vagrant/src/exp5');

p=5;
q=7;
[n tociente e d] = pegaParametros(p,q);
M=20;

disp('Criptografia');
%Criptografia
C=pegar_mod(M,e,n);
%C=mod(M^e,n);
disp('C');
disp(C);

%Decriptografia
disp('Decriptografia');
HH=pegar_mod(C,d,n);
disp('HH');
disp(HH);