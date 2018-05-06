function [ net ] = reTreino( varargin )
%funcao para retreinar uma rede neural, desta forma, é necessário ter a
%rede
% Input
% varargin{1} - rede neural treinada 
%output
%net - rede neural retreinada
%% inicializacao de variahveis
    net = varargin{1};
    di = varargin{2};
    dt = varargin{3};
    W = varargin{4};
    n_epochs = varargin{5};
    
%% cohdigo
    net.trainParam.epochs = n_epochs;
    net.trainParam.showWindow = false;
%     net=train(net,di,dt,{},{},{},W,'useParallel','yes');
    net=train(net,di,dt,{},{},{},W);
    %net=adapt(net,di,dt);
end

