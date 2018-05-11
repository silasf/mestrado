%scrip para treinar redes de previsao

    load('entradas.mat');
    neuronios=[2 3 4 5 7 10 12 15 20];
    nvezes=50;
    
    all_nets = {};
    times = zeros (nvezes,length(neuronios));

    parfor i=1:length(neuronios)      
        net=criaNET(1,neuronios(i),di,dt);
        net.trainParam.showWindow = false;
        sucm=-1;
        
        for vez=1:nvezes
            tic; % inicio do tempo
            
            fprintf('train N%d.%d \n',neuronios(i),vez);
            net=init(net);
%             net=train(net,di,dt,{},{},{},W,'useParallel','yes');
            net=train(net,di,dt,{},{},{},W);
            all_nets{vez,i} = net;
            
            time = toc; %fim time
            times(vez,i) = time;
        end
        
    end
    save('traino2a20.mat','all_nets','times');
    clear all;
