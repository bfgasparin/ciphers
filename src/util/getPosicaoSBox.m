function posicao = getPosicaoSBox(p, n, C)
	linhaPoli = C(1:n/2);
	colunaPoli = C(n/2+1:n);

	linha = binaryToDecimal(linhaPoli);
	coluna = binaryToDecimal(colunaPoli) + 1;

	posicao = coluna + 4*linha;
end;