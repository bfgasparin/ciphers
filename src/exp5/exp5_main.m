addpath('/vagrant/src/util');
addpath('/vagrant/src/corposFinitosUtil');
addpath('/vagrant/src/exp5');

setenv('GNUTERM', 'X11');

findPrimeGraph = [];
execucoesPorTentativa = 10;
totalForward = 11;
%A partir de 1000000000 ele demora mais de 100.000 tentivas (com mais de 4h de execucao)
randonNBase = 100;

randonNBaseOrig = randonNBase;
for baseCalc=0:totalForward
	mediaTentativasExec = 0;
	if mod(baseCalc, 2) == 0
		randonNBase = randonNBaseOrig * 10;
		randonNBaseOrig = randonNBase;
	else
		randonNBase = randonNBaseOrig + (randonNBaseOrig/2);
	end	
	
	randonNBase

	for exec=1:execucoesPorTentativa
		
		nRdnComposto = true;
		findPrimeTries = 0;
		primesAlreadyTried = [];
		while nRdnComposto == true
			[nRdn, knRnd, qnRnd] = getRandomIntNear(randonNBase);
			alreadyTried = false;
			for at=1:findPrimeTries
				if primesAlreadyTried(at) == nRdn
					alreadyTried = true;
					break;
				end
			end

			if alreadyTried == false
				findPrimeTries = findPrimeTries + 1;
				primesAlreadyTried(findPrimeTries) = nRdn;
				nRdnComposto = false;
				for m=1:10
					resultMR = millerRabbin(nRdn, knRnd, qnRnd);
					if strcmp(resultMR, 'composto')
						nRdnComposto = true;
					end
					if nRdnComposto == true
						break;
					end
				end

				if findPrimeTries > 99999999
					break;
				end
			end

		end
		mediaTentativasExec = mediaTentativasExec + findPrimeTries;
	end
	mediaTentativasExec = ceil(mediaTentativasExec / execucoesPorTentativa)

	findPrimeGraph(baseCalc+1) = mediaTentativasExec;
end
findPrimeGraph

%graphName = ["graphs/exp5/findPrimeNumbers.png"];
%plot(findPrimeGraph)
%legend(["Tentativas para encontrar numeros primos"]);
%title(["Numeros Primos"]);
%xlabel('range primos');
%ylabel('tentativas');
%print(graphName)