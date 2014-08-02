addpath('/vagrant/src/util');
addpath('/vagrant/src/corposFinitosUtil');
addpath('/vagrant/src/exp5');

findPrimeGraph = [];
totalForward = 10;
randonNBase = 1000;
baseCalc = 1;
	
randonNBaseOrig = randonNBase;
while (randonNBase <= 400000000)
	randonNBase
	count = 0;
	for exec=1:execucoesPorTentativa
			[nRdn, knRnd, qnRnd] = getRandomIntNear(randonNBase);
			[n2Rdn, kn2Rnd, qn2Rnd] = getRandomIntNear(randonNBase);
			
			[inv_e mdc]=euclidesEstendido(nRdn,n2Rdn);
			if mdc == 1
				count = count + 1;
			end
	end

	findPrimeGraph(baseCalc+1) = count/10;
	baseCalc = baseCalc+1;
end
findPrimeGraph

graphName = ["graphs/exp5/findRelativePrime.png"];
plot(findPrimeGraph)
legend(["Probabilidade de serem relativamente primos"]);
title(["Numeros Primos"]);
xlabel('range primos');
ylabel('probabilidade');
print(graphName)

