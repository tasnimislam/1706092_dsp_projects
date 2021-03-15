function y_quantized= quantize(x_sampled,bit)
N=length(x_sampled);
L=2^bit;
del=((max(x_sampled)+0.0000000001)-min(x_sampled))/(L-1);

    for j=1:L
        level(j)=min(x_sampled)+del*(j-1);
    end
    
    for i=1:N
        for j=1:L-1
            if(x_sampled(i)>=level(j)&& x_sampled(i)<level(j+1))
                if(x_sampled(i)>=level(j)+.5*del)
                    y_quantized(i)=level(j+1);
                else
                   y_quantized(i)=level(j);
                end
            end
        end
    end
    y_quantized
          