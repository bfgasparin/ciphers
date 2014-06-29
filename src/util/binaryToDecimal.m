function decimal = binaryToDecimal(binario)
	
lenBinario = length(binario);
potencias = [];
potenciasTemp = 2.^(0:lenBinario-1);

for i=0:lenBinario-1
	potencias = [potencias potenciasTemp(lenBinario-i)];
end

decimal = binario*potencias';

end;