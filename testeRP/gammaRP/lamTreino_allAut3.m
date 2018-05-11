function [ nets ] = lamTreino_allAut3( varargin )
% mudanca da anterior, agora usamos a matriz da entrada quantizada toda em
% memoria.

%% Entradas
% -varargin{1} - net % nome do arquivo que contem as redes
% -varargin{2} - mtz entrada quantizada
% -varargin{3} - ini da coleta
% -varargin{4} - fim da coleta
% -vararbin{5} - tamanho da oportunidade


%% inicialização
    net = varargin{1};
    mtzQuat = varargin{2};
    ini = varargin{3};
    fim = varargin{4};
    opo = varargin{5}; % oportunidade
    gammas = varargin{6}; %vezes que repassa o backpropagation


    tm = length(net);
    nets = cell(tm,fim);
    
    for k=1:length(gammas)
        gamma = gammas(1,k);
        parfor j=1:tm 
            rede = net{1,j};
            for i = ini:fim

                entrada = mtzQuat(i,:); %de acordo com artigo cnn
                target = geraTargetCZ2(entrada,opo); % gera target correta com contazeros

                %peso
                a = length(target);
                b = sum((target(2,:)) ==1);
                w = b/a;

                [di, dt] = obterDiDt({entrada},{target}); %pode se que mude o dt, di deve continuar o mesmo
                for p=1:gamma
                    rede = reTreino( rede,di,dt,w,1);
                end

                nets{j,i} = rede; 
                fprintf('%d.%d \n',j,i);% k virou i, mudanca da paralelizacao
            end
        end
        str = sprintf('gamma%d.mat',gamma);
        save(str,'nets');
    end
    mailteste %script para avisar o termínio do treinamento
    mailteste
end

