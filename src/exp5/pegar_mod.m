function  res = pegar_mod(base, e, n)
    b=dec2bin(e);
    k=size(b,2);
    c=0;
    f=1;
    i=1;
    while i<=k
       c = 2 * c;
       f=mod((f*f),n);
       if(b(i)=='1')
          c=c+1;
          f = mod((f*base), n);
       end 
       i=i+1;
    end
    res=f;
end