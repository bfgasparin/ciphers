function C = feistel(P,K,rodadas)

C = P;
blocoSize = 32;

KLength = length(K);
for i=1:rodadas

	bit = mod(rodadas, KLength) + 1;
	
	K(bit) = ~K(bit); %inverte um dos bits da chave K

	CR = C(blocoSize+1:2*blocoSize);
	
	aux = hillE2(CR, K);
	CL = xor(aux, C(1:blocoSize));

    C = [CR CL];
end