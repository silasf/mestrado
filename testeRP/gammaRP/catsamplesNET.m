function [di]=catsamplesNET(dinput)
% dado dinput faz o catsamples 'pad' para treino das redes

    [nin,~]=size(dinput{1});
    nvet=length(dinput);
    di={};
    ma=0;
    for n=1:nvet
        m1=length(dinput{n});
        if(m1>ma)
            ma=m1;
        end
    end

    for n=1:ma
        di{1,n}=zeros(nin,nvet)+nan;
    end

    for n=1:nvet
        [nl,nc]=size(dinput{n});
        for i=1:nl
            for j=1:nc
                di{1,j}(i,n)=dinput{n}(i,j);
            end
        end
    end
end
