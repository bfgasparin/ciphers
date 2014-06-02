function C = hillE2(P,K)

sizeP = size(P)(2);

auxP = zeros(0,3);
remain = 0;

i = 1;
while i <= sizeP
  if ((i + 2) > sizeP)
  	remain = i+2 - sizeP;
  	auxP = [auxP; [P(i:sizeP) zeros(1, remain)]];
  else
	auxP = [auxP; P(i:i+2)];
  endif
  i = i+3;  
end  

P = (mod(K*(auxP'), 2))(:)';
P = P(1:sizeP); 

C = P;

end
