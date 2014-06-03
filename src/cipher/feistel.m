function C = feistel(P,K,rodadas)

C = P;
blocoSize = 32;
for i=1:rodadas

	CR = C(blocoSize+1:2*blocoSize);
	
	aux = hillE2(CR, K);
	CL = xor(aux, C(1:blocoSize));

    C = [CR CL];
end