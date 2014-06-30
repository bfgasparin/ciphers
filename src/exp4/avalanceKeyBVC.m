addpath('/vagrant/src/cipher');
addpath('/vagrant/src/util');
addpath('/vagrant/src/corposFinitosUtil');

nBits = 16;
nRepeticoes = 100;
nRodadas = 25;
p = 2;
n = 4;


entropia = zeros(1,nRodadas);

poliIrredutiveis = irredutiveisGF(p, n);
poliIrredutivel = poliIrredutiveis(3,:);
sbox = getSBox(p, n, poliIrredutivel);

for rodadas=1:nRodadas
    matriz = zeros(nBits,nBits);
    for repeticoes=1:nRepeticoes;
        for bit=1:nBits
        	P = rand(1,nBits)>.5; %obtem uma texto de bits aleatoria
			K1 = rand(1,nBits)>.5; %obtem uma chave aleatoria

			P = convertBoolToInt(P);
			K1 = convertBoolToInt(K1);

            C1 = BVCE(P,K1,rodadas, sbox);

            K2 = K1;
            K2(bit) = ~K2(bit); %inverte um dos bits da chave K1

            K2 = convertBoolToInt(K2);
            C2 = BVCE(P,K2,rodadas, sbox);

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
legend(["BVC"]);
title(["Entropia"]);
xlabel('rodadas');
ylabel('Entropia');
print(graphName);