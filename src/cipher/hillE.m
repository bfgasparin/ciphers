function C = hillE(P,K)

C = P;
% Elimina caracteres que nao sao texto
indexTexto = find((P>='a'&P<='z')|(P>='A'&P<='Z'));
P = P(indexTexto);

% Reduz a caixa de todos caracteres
indexCaixaAlta = find((P>='A'&P<='Z'));
P(indexCaixaAlta) = P(indexCaixaAlta) + ('a'-'A');

disp(size(P));

sizeP = size(P)(2);

auxP = zeros(0,3);
remain = 0;

i = 1;
while i <= sizeP
  if ((i + 2) > sizeP)
  	remain = i+2 - sizeP;
  	auxP = [auxP; [P(i:sizeP) zeros(1, remain)]];
  else
	auxP = [auxP; P(i:i+2)];
  endif
  i = i+3;  
end  

P = (mod(K*(auxP' - 'a'), 26) + 'a')(:)';
P = P(1:sizeP); 

% Retorna para caixa alta
P(indexCaixaAlta) = P(indexCaixaAlta) + ('A'-'a');

% Atualiza caracteres que sao texto
C(indexTexto) = P;

end
