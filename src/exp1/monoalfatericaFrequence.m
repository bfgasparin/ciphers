addpath('/vagrant/src/cipher');

P = readText('Resources/files/exp1/notes.txt');
C = monoalfabeticaE(P,'knmporqtsvuxwzybadcfeghjil');

%saveText(C,'crimepunishment_Cifrado.txt');
[rateMono character] = countCharacters(C);

plot([1:26],rateMono);
legend('Monoalfabetica');
title('Frequencia de Letras em Textos Cifrados');
xlabel('letras');
ylabel('percentagem de ocorrencia');
print -dpng 'graphs/exp1/monoalfabeticaFrequence.png'
