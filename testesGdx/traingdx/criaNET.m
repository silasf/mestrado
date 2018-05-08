function net = criaNET(nd,nh,di,dt)
% Cria a rede Eleman compativel como o tlearn
% ex.: net=criaNET(1:1,5,di,dt);

net=elmannet(nd,nh);
net=configure(net,di,dt);
net.trainFcn='traingdx';
%net.trainFcn='traingdm';
%net.trainFcn='trainlm';
% net.trainFcn='trainscg';
%net.trainFcn='trainrp';

%net.derivFcn='defaultderiv';
net.divideFcn = '';
%net.divideFcn = 'dividerand';

net.inputs{1}.processFcns={'fixunknowns'};
net.outputs{1,2}.processFcns={};
for i=1:net.numLayers
    net.layers{i,1}.transferFcn='logsig';
end

net.trainParam.min_grad = 1e-20;
net.trainParam.epochs = 20000;
net.trainParam.goal = 1e-5;
net.trainParam.max_fail = 10;
net.trainParam.lr=0.1;
%net.trainParam.mu_max=1e99;
% net.efficiency.memoryReduction=4;
net=init(net);

end

