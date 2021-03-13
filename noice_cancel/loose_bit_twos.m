function restore= loose_bit_twos(encod)
    for i=1:length(encod)
        encod(i,end-1:end) = '0';
        if encod(i, 1)=='1'
            d=1;
            x = char.empty(length(encod(i, :)), 0)
            c1=not(encod(i,:)-'0');   % one's complement
            for k=numel(encod(i, :)):-1:1
              r=d & c1(k);
              c2(1,k)=xor(d,c1(k));  % c2 is two's complement
              d=r;
            end
            encod(i, :) = dec2bin(double(c2))
            x = bin2dec(encod(i, :))
            restore(i, :) = x
        else
           restore(i, :) = bin2dec(encod(i, :)) 
        end
    end
    restore
