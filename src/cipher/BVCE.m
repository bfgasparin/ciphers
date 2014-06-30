function C = BVCE(P,K, rodadas)

	p = 2;
	n = 4;

	blocos = size(P)(2)/4;

	poliIrredutiveis = irredutiveisGF(p, n);
	poliIrredutivel = poliIrredutiveis(3,:);

	sbox = getSBox(p, n, poliIrredutivel);

	C = blocos;

	for i=1:rodadas

		# substituicao
		C1 = P(1:blocos);
		C2 = P(5:blocos*2);
		C3 = P(9:blocos*3);
		C4 = P(13:blocos*4);

		C1 = sbox(decimalGet(C1, p));
		C2 = sbox(decimalGet(C2, p));
		C3 = sbox(decimalGet(C3, p));
 		C4 = sbox(decimalGet(C4, p));

 		# permutacao

	end

end
