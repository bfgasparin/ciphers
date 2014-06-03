function C = feistel(P,K,rodadas)

C = P;
blocoSize = 32;

cols = size(K)(1);
lastBit = size(K)(1)*size(K)(1);
subkTemp = K(1:lastBit);
subK = K;

KLength = length(K);
for i=1:rodadas

	bit = mod(rodadas, KLength) + 1;
	
	%K(bit) = ~K(bit); %inverte um dos bits da chave K

	subkTemp = [subkTemp(lastBit) subkTemp(1:lastBit-1)];
	for k=1:cols
		subK(k:cols) = subkTemp(k:cols);
	end

	CR = C(blocoSize+1:2*blocoSize);
	
	aux = hillE2(CR, subK);
	CL = xor(aux, C(1:blocoSize));

    C = [CR CL];
end