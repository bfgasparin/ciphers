function sbox = getSBox(p, n, poliIrredutivel)
	z = 2^n;
	sbox = zeros(1, z);

	for i=1:z

		polinomioDecimal = i-1;
		polinomio = poliGet(polinomioDecimal, p, n);
		
		#posicao = getPosicaoSBox(p, n, polinomio);
		posicao = i;
		
		inverso = euclidesEstendidoPolinomial(polinomio, poliIrredutivel, p);
		
		sbox(posicao) = decimalGet(inverso, p);
	end
end