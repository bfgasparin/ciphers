function C = hillE2(P,K)

sizeP = size(P)(2);
sizeK = size(K)(2);

auxP = zeros(0,sizeK);
remain = 0;

i = 1;
while i <= sizeP
  if ((i +  (sizeK - 1) ) > sizeP)
  	remain = i+ (sizeK - 1)  - sizeP;
  	auxP = [auxP; [P(i:sizeP) zeros(1, remain)]];
  else
	auxP = [auxP; P(i:i+ (sizeK - 1) )];
  endif
  i = i+sizeK;  
end  

P = (mod(K*(auxP'), 2))(:)';
P = P(1:sizeP); 

C = P;

end
