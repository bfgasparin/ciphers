function C = feistel(P,K,rodadas)

C = P;
blocoSize = 32;

cols = size(K)(1);
lastBit = size(K)(1)*size(K)(1);
subKTemp = K(1:lastBit);
subK = K;

KLength = length(K);
for i=1:rodadas

	bit = mod(rodadas, KLength) + 1;
	
	subK(bit) = ~subK(bit); %inverte um dos bits da chave K

	%MultiK com Shift
	%subKTemp = [subKTemp(lastBit) subKTemp(1:lastBit-1)];
	%for Kindex=1:cols
	%	indexTemp = cols*Kindex - cols + 1;
	%	subK(Kindex:cols) = subKTemp(indexTemp:cols*Kindex);
	%end

	CR = C(blocoSize+1:2*blocoSize);
	
	aux = hillE2(CR, subK);
	CL = xor(aux, C(1:blocoSize));

    C = [CR CL];
end