
function  res = pegar_mod(base, e, m)
    b=dec2bin(e);
    k=size(b,2);
    c=0;
    f=1;
    i=1;
    while i<=k
       c = 2 * c;
       f=mod((f*f),m);
       if(b(i)=='1')
          c=c+1;
          f = mod((f*base), m);
       end 
       i=i+1;
    end
    res=f;
end

