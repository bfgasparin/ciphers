function [n, k, q] = getRandomIntNear(N)
	min = ceil(0.9*N);
	max = ceil(1.1*N);
	maxk = log2(max);
	k = randi(maxk);
	n = (2.^k);

	maxq = ceil((max/n));
	minq = ceil((min/n));
	 
	q = 0;
	sum = maxq - minq;
	if sum == 0 || sum == 1
	  sum = 2;
	end
	while mod(q,2)==0
	  q = minq + randi(sum);
    end
	 
	n = (n * q) + 1;

end