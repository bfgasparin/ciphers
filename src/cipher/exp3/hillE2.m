function C = hillE2(P,K)

sizeP = size(P)(2);

auxP = zeros(0,16);
remain = 0;

i = 1;
while i <= sizeP
  if ((i + 15) > sizeP)
  	remain = i+15 - sizeP;
  	auxP = [auxP; [P(i:sizeP) zeros(1, remain)]];
  else
	auxP = [auxP; P(i:i+15)];
  endif
  i = i+16;  
end  

P = (mod(K*(auxP'), 2))(:)';
P = P(1:sizeP); 

C = P;

end
