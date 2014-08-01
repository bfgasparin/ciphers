addpath('/vagrant/src/util');
addpath('/vagrant/src/corposFinitosUtil');
addpath('/vagrant/src/exp5');

tic
menor=3;
maior=1000;%checar intervalo
qtdNumeros=1000;
qtdTestes=1000;
confiancaQueEPrimo = 0.9;



nTeste=[];
vetorDePrimos=[];
vetorDeTestes=[];
  
for i=1:qtdNumeros
  numero = ceil(rand*(maior - menor+1));
  if(mod(numero,2)==0) 
      continue;
  end
  disp('numero: ');
  disp(numero);
  qtdInconclusivo=0;
  qtdComposto=0;
  for j=1:qtdTestes
    
    a = ceil(rand*((numero-1) - 1+1));
    res = testeMR(numero,a);

    x = strcmp('inconclusivo',res);
    disp(x);
    if x>0
        qtdInconclusivo = qtdInconclusivo + 1;
        disp('qtdInconclusivo');
        disp(qtdInconclusivo);
        %if (qtdInconclusivo/qtdTestes) >=  confiancaQueEPrimo
            p=17;
            q=numero;
            M=88;
            y=eh_Primo(M,p,q);
            disp('Y');
            disp(y);
            if y==1
                vetorDePrimos=[vetorDePrimos numero];
                vetorDeTestes=[vetorDeTestes j];
                j = 1;
                break 
            end
        %end
    else
        qtdComposto = qtdComposto + 1;
        break
    end
  end      
end
disp('vetorDePrimos');
disp(vetorDePrimos);
disp('vetorDeTestes');
disp(vetorDeTestes);
plot(vetorDePrimos, vetorDeTestes,'g');
%legend('Primos por Testes');
title('Teste executados para encontrar os numeros primos');
xlabel('Numero Primo');
ylabel('Qtd. de Testes')

%print -dpng lab1.png
toc