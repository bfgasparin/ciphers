addpath('/vagrant/src/util');
addpath('/vagrant/src/corposFinitosUtil');
addpath('/vagrant/src/exp5');

findPrimeGraph = [];
randonNBase = 1000;

	graphIndex = 1;
randonNBaseOrig = randonNBase;
while (randonNBase <= 50000000)
	randonNBase = randonNBase*2;
randonNBase
	count = 0;
	for exec=1:1000
			[nRdn, knRnd, qnRnd] = getRandomIntNear(randonNBase);
			[n2Rdn, kn2Rnd, qn2Rnd] = getRandomIntNear(randonNBase);
			
			[inv_e mdc]=euclidesEstendido(nRdn,n2Rdn);
			if mdc == 1
				count = count + 1;
			end
	end

	baseN(graphIndex) = uint64(randonNBase);		
	tentativas(graphIndex) = count/10;
	graphIndex = graphIndex+1;
end
findPrimeGraph

graphName = ["graphs/exp5/findRelativePrime.png"];
plot(baseN, tentativas);
legend(["Probabilidade de serem relativamente primos"]);
title(["Numeros Primos"]);
xlabel('range primos');
ylabel('probabilidade');
print(graphName)

