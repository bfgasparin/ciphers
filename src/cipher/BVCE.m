function C = BVCE(P,K, rodadas, sbox)

	p = 2;
	n = 4;

	blocos = size(P)(2)/4;

	Kr = K;
	for i=1:rodadas
		C = xor(P, Kr);

		C = convertBoolToInt(C);

		# substituicao
		C1 = C(1:blocos);
		C2 = C(5:blocos*2);
		C3 = C(9:blocos*3);
		C4 = C(13:blocos*4);

		C1 = sbox(decimalGet(C1, p) + 1);
		C2 = sbox(decimalGet(C2, p) + 1);
		C3 = sbox(decimalGet(C3, p) + 1);
 		C4 = sbox(decimalGet(C4, p) + 1);

 		C = [poliGet(C1, p, n) poliGet(C2, p, n) poliGet(C3, p, n) poliGet(C4, p, n)];
 		
 		# permutacao
 		shiftQtd = mod(i, 4)*4;
 		C = shift(C, shiftQtd);

 		# roundKey
		K1 = Kr(1:blocos);
		K2 = Kr(5:blocos*2);
		K3 = Kr(9:blocos*3);
		K4 = Kr(13:blocos*4);

		K1 = sbox(decimalGet(K1, p) + 1);
		K2 = sbox(decimalGet(K2, p) + 1);
		K3 = sbox(decimalGet(K3, p) + 1);
 		K4 = sbox(decimalGet(K4, p) + 1);

 		Kr = [poliGet(K4, p, n) poliGet(K1, p, n) poliGet(K2, p, n)  poliGet(K3, p, n)];
	end

end
