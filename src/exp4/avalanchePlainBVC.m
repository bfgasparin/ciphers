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
        for bit=1:nBits
            P1 = rand(1,nBits)>.5; %obtem uma texto de bits aleatoria
            K = rand(1:nBits)>.5; %obtem uma chave aleatoria

            P1 = convertBoolToInt(P1);
            K = convertBoolToInt(K);

            C1 = BVCE(P1,K,rodadas);

            P2 = P1;
            P2(bit) = ~P2(bit); %inverte um dos bits da bloco de texto
            P2 = convertBoolToInt(P2);
            C2 = BVCE(P2,K,rodadas);

            %computa o que mudou na cifra
            matriz(bit,:) = matriz(bit,:) + xor(C1,C2);
        end    
    end
    disp(rodadas)
    fflush(stdout);
    matriz = matriz/repeticoes;
    % Aqui, o max e utilizado para garantir que log(0) = 0
    entropia(rodadas) = mean(mean((max(-log2(matriz).*matriz,0) + max(-log2(1-matriz).*(1-matriz),0))));
end

graphName = ["graphs/exp4/final/bgcPlain11111.png"];
plot(entropia)
legend(["BVC"]);
title(["Entropia"]);
xlabel('rodadas');
ylabel('Entropia');
print(graphName);