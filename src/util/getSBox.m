function sbox = getSBox(p, n, poliIrredutivel)
	z = 2^n;
	aSbox = zeros(1, z);

	for i=0:z-1

		polinomio = poliGet(i, p, n);
		
		inverso = euclidesEstendidoPolinomial(polinomio, poliIrredutivel, p);
		
		aSbox(i+1) = decimalGet(inverso, p);

		# shift 5 para os polinomios inversiveis nao serem iguais ao polinomios originais
		sbox = shift(aSbox, 5);
	end
end