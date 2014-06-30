function C = convertBoolToInt(P)
	C = [];
	for i=1:length(P)
		if P(i)
			C(i) = 1;
		else
			C(i) = 0;
		end
	end
end


