function sbox = getSBox(p, n)
	z = 2^n;
	sbox = zeros(1, z);

	poliIrredutiveis = irredutiveisGF(p, n);
	poliIrredutivel = poliIrredutiveis(1,:);

	poliIrredutivel
	for i=1:z
		#polinomio = poliGet(i, p, n);
		#sbox(i) = decimalGet(polinomio, p);
		polinomioDecimal = i-1;
		polinomio = poliGet(polinomioDecimal, p, n);
		

		inverso = euclidesEstendidoPolinomial(polinomio, poliIrredutivel, p);
		
		sbox(i) = decimalGet(inverso, p);
	end
end