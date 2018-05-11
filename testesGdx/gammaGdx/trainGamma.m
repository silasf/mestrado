function trainGamma(varargin)

    redes = varargin{1};
    fragQtz = varargin{2};
    opo = varargin{3};
    gammas = varargin{4};
    
    tc = length(fragQtz(1,:)); % quantidade de colunas
    tl = length(fragQtz);% quatidade de linhas
    tr = length(redes); %quantidade de redes
    tg = length(gammas); %quantidade de gammas
    
    for l=1:tg
        gamma = gammas(1,l);
        parfor k=1:tr
            rede = redes{1,k};
            for j=1:tl
                for i=1:tc
                    entrada = fragQtz{j,i}; %de acordo com artigo cnn
                    target = geraTargetCZ2(entrada,opo); % gera target correta com contazeros

                    %peso
                    a = length(target);
                    b = sum((target(2,:)) ==1);
                    w = b/a;

                    [di, dt] = obterDiDt({entrada},{target}); %pode se que mude o dt, di deve continuar o mesmo
                    for p=1:gamma
                        rede = reTreino( rede,di,dt,w,1);
                    end
                end
                nets{k,j} = rede;
                fprintf('%d.%d \n',k,j);
            end
        end
        str = sprintf('gamma%d.mat',gamma);
        save(str,'nets');
    end

end