addpath('/vagrant/src/cipher');
addpath('/vagrant/src/cipher/exp3');

nBits = 64;
nRepeticoes = 100;
nRodadas = 25;

entropia = zeros(1,nRodadas);

for rodadas=1:nRodadas
    matriz = zeros(nBits,nBits);
    for repeticoes=1:nRepeticoes;
        % iterates over the key length
        for bit=1:9 
            P = rand(1,nBits)>.5; %obtem uma texto de bits aleatoria

            K1 = rand(3:3)>.5; %obtem uma chave de bits aleatorio
            C1 = feistel(P,K1,rodadas);

            K2 = K1;
            K2(bit) = ~K2(bit); %inverte um dos bits da chave K1
            C2 = feistel(P,K2,rodadas);

            %computa o que mudou na cifra
            matriz(bit,:) = matriz(bit,:) + xor(C1,C2);
        end
    end
    disp(rodadas)
    fflush(stdout);
    matriz = matriz/nRepeticoes;
    % Aqui, o max e' utilizado para garantir que log(0) = 0
    entropia(rodadas) = mean(mean((max(-log2(matriz).*matriz,0) + max(-log2(1-matriz).*(1-matriz),0))));
end

graphName = ["graphs/exp3/feistelKey.png"];
plot(entropia)
legend(["Feistel"]);
title(["Entropia"]);
xlabel('rodadas');
ylabel('Entropia');
print(graphName);
