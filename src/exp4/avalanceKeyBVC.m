addpath('/vagrant/src/cipher');
addpath('/vagrant/src/util');
addpath('/vagrant/src/corposFinitosUtil');

nBits = 16;
nRepeticoes = 100;
nRodadas = 25;

entropia = zeros(1,nRodadas);

for rodadas=1:nRodadas
    matriz = zeros(nBits,nBits);
    for repeticoes=1:nRepeticoes;
        % iterates over the key length
        for bit=1:64
        	P = rand(1,nBits)>.5; %obtem uma texto de bits aleatoria
			K1 = rand(1:nBits)>.5; %obtem uma chave aleatoria

            C1 = BVCE(P,K1,rodadas);

            K2 = K1;
            K2(bit) = ~K2(bit); %inverte um dos bits da chave K1
            C2 = BVCE(P,K2,rodadas);

            %computa o que mudou na cifra
            matriz(bit,:) = matriz(bit,:) + xor(C1,C2);
        end
    end
    disp(rodadas)
    fflush(stdout);
    matriz = matriz/nRepeticoes;
    % Aqui, o max e utilizado para garantir que log(0) = 0
    entropia(rodadas) = mean(mean((max(-log2(matriz).*matriz,0) + max(-log2(1-matriz).*(1-matriz),0))));
end

graphName = ["graphs/exp4/final/bgcKey11111.png"];
plot(entropia)
legend(["Feistel"]);
title(["Entropia"]);
xlabel('rodadas');
ylabel('Entropia');
print(graphName);