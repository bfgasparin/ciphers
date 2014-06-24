function C = AESE(P,K)

SBox = zeros(16, 16);
for key=1:255
    SBox[key] key;
end

C = SBox;

end
