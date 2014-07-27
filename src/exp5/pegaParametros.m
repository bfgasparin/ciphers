function [n tociente e d] = pegaParametros(p,q)
    n=uint64(p*q);
    tociente=(p-1)*(q-1);
    mdc_atual=0;
    e_atual=2;
    e=e_atual;
    while mdc_atual ~=1 && e < tociente  
        [inv_e mdc]=euclidesEstendido(e_atual,tociente);
        e=e_atual;
        d=inv_e;
        mdc_atual=mdc;
        e_atual=e_atual+1;
    end
end

