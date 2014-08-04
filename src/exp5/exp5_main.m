addpath('/vagrant/src/util');
addpath('/vagrant/src/corposFinitosUtil');
addpath('/vagrant/src/exp5');

% To call this script, go to project directory:
%     
%     cd /<project-dir>
%
% And execute 
%    
%     octave -p src/ src/exp5/exp5_main.m
%
% It saves the the result intoa a png graph called 'findPrimeNumbers.png' into 'graphs/exp5' directory. 

findPrimeGraph = [];
execucoesPorTentativa = 50;
totalForward = 30;
%A partir de 1000000000 ele demora mais de 100.000 tentivas (com mais de 4h de execucao)
randonNBase = 1000;

randonNBaseOrig = randonNBase;
graphIndex = 0;
while (randonNBase <= 50000000)
	mediaTentativasExec = 0;
	randonNBase = randonNBase*2;
		
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
	
    graphIndex = graphIndex + 1;
	baseN(graphIndex+1) = uint64(randonNBase);		
	tentativas(graphIndex+1) = mediaTentativasExec;
	% findPrimeGraph(graphIndex+1) = mediaTentativasExec;
end
findPrimeGraph

graphName = ["graphs/exp5/findPrimeNumbers.png"];
plot(baseN, tentativas);
legend(["Tentativas para encontrar numeros primos"]);
title(["Numeros Primos"]);
xlabel('range primos');
ylabel('tentativas');
print(graphName)

