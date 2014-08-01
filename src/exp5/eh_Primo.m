function res = eh_Primo(M,p,q)
    [n tociente e d] = pegaParametros(p,q);
    if(d==0)
        res=0;
        return;
    end
    base=M;
    C=pegar_mod(base,e,n);
    R=pegar_mod(C,d,n);
    if R==M
        res=1;
        return;
    end
    res=0;
end

