function C = AESE(P,K)

sBox = zeros(16, 16);
for key=1:256
    sBox(key)=key-1;
end

C = sBox';

end
