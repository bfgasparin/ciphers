addpath('/vagrant/src/cipher');

% This script must recieve the given parameters
%     arg1   cipher   The name of the cipher, that mut be either
%	                  'monoalfabetica', 'vigenere', 'vigenereIncre' or 'hill' 
%     arg2   K        The key to be used by the cipher
% 
% Example: octave -p src/ src/exp1/letterFrequence.m monoalfabetica knmporqtsvuxwzybadcfeghjil
%
% It saves the the result intoa a png graph into 'graphs/exp1' directory. The name of the graph
% has the following structure: 
%
%     <cipher>_<K>_Frequece.png

argList = argv();
cipher  = argList{1};
K  = argList{2};

K = [17 17 5; 21 18 21; 2 2 19];

P = readText('Resources/files/exp1/notes.txt');
% P = 'valdinei';

switch (cipher)
  case 'monoalfabetica'
	C = monoalfabeticaE(P,K);    
  case 'vigenere'
    C = vigenereE(P,K);    
  case 'vigenereIncre'
    C = vigenereIncreE(P,K);
  case 'hill'
    C = hillE(P,K);    
  otherwise
    error ("The fisrt parameter must be either 'monoalfabetica', 'vigenere', 'vigenereIncre' or 'hill'");
endswitch

%saveText(C,'crimepunishment_Cifrado.txt');
[rateMono character] = countCharacters(C);

graphName = ["graphs/exp1/" cipher "_"  "_frequence.png"];

plot([1:26],rateMono);
legend([cipher]);
title(["Frequencia de Letras em Textos Cifrados \n K = '" "'"]);
xlabel('letras');
ylabel('percentagem de ocorrencia');

print(graphName);
