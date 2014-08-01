function res = testeMR(n,a)
    k=1;
    q=1;
    afirmacao=(1>2);
    i=1;
    %etapa 1
    while i<n
      while q<n
            afirmacao=((2.^k)*q==n-1);
            if(afirmacao>0)
                break;
            end
            q=q+2;
       end
       if(afirmacao>0)
            break;
       end
       k=k+1;
       i=i+1;
    end
    
    %etapa 2
    %a = ceil(rand*((n-1) - 1+1));
    %a = 1 + ((n-1)-1)*randi(1);
    if(mod(a.^q,n)==1)
        res='inconclusivo';
        return;
    end
    for j=0:k-1
        p=a.^((2.^j)*q);
        if(mod(p,n)==n-1);
            res='inconclusivo';
            return;
        end
    end
    res='composto';
    return;
end