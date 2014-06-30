function C = BVCE(P,K, rodadas)

	p = 2;
	n = 4;

	blocos = size(P)(2)/4;

	poliIrredutiveis = irredutiveisGF(p, n);
	poliIrredutivel = poliIrredutiveis(3,:);

	sbox = getSBox(p, n, poliIrredutivel);

	C = blocos;
	Kr = K;
	for i=1:rodadas
		C = xor(P, Kr);

		# substituicao
		C1 = P(1:blocos);
		C2 = P(5:blocos*2);
		C3 = P(9:blocos*3);
		C4 = P(13:blocos*4);

		C1 = sbox(decimalGet(C1, p));
		C2 = sbox(decimalGet(C2, p));
		C3 = sbox(decimalGet(C3, p));
 		C4 = sbox(decimalGet(C4, p));

 		C = [C1 C2 C3 C4];
 		
 		# permutacao
 		shiftQtd = i%4 * 4;
 		C = shift(C, shiftQtd);

 		# roundKey
		K1 = Kr(1:blocos);
		K2 = Kr(5:blocos*2);
		K3 = Kr(9:blocos*3);
		K4 = Kr(13:blocos*4);

		K1 = sbox(decimalGet(K1, p));
		K2 = sbox(decimalGet(K2, p));
		K3 = sbox(decimalGet(K3, p));
 		K4 = sbox(decimalGet(K4, p));

 		Kr = [K4 K2 K1 K3];
	end

end
