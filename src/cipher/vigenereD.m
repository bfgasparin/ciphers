function C = vigenereD(P,K)

C = P;
% Elimina caracteres que nao sao texto
indexTexto = find((P>='a'&P<='z')|(P>='A'&P<='Z'));
P = P(indexTexto);

% Reduz a caixa de todos caracteres
indexCaixaAlta = find((P>='A'&P<='Z'));
P(indexCaixaAlta) = P(indexCaixaAlta) + ('a'-'A');


tamChave = length(P);
chaveAux = (mod([0:tamChave - 1], 3) + 1) * -1;

chaveAux(find(chaveAux == -1)) = K(1) - 'a';
chaveAux(find(chaveAux == -2)) = K(2) - 'a';
chaveAux(find(chaveAux == -3)) = K(3) - 'a';

P = mod(P - 'a' - chaveAux, 26) + 'a';


% Retorna para caixa alta
P(indexCaixaAlta) = P(indexCaixaAlta) + ('A'-'a');

% Atualiza caracteres que sao texto
C(indexTexto) = P;

end
