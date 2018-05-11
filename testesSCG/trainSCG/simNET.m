function y=simNET(net,x)
% Avalia a rede net com a entrada x, na forma de uma sequencia de amostras
    y=cell2mat(sim(net,num2cell(x)));
end
