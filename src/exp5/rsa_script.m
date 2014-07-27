addpath('/vagrant/src/util');
addpath('/vagrant/src/corposFinitosUtil');
addpath('/vagrant/src/exp5');


p=17;
q=11;
[n tociente e d] = pegaParametros(p,q);
M=88;
e=7;
d=23;

%Criptografia
C=pegar_mod(M,e,n);
%C=mod(M^e,n);
disp('C');
disp(C);

%Decriptografia

M=pegar_mod(C,d,n);
%M=mod(C^d,n),
disp('M');
disp(M);