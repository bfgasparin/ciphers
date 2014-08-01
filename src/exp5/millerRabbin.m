function res = millerRabbin(n,k,q)
    
    j = 0;
    a = ceil(rand*((n-1) - 1+1));
    res = 'composto';

    if(pow_mod(a,q,n)==1)
        res='inconclusivo';
        return;
    end

    for j=0:k-1
        x = 2.^j;
        x = x*q;
        if (pow_mod(a, x, n) == (n-1))  
            res='inconclusivo';
            return;
        end
    end

    return;
end