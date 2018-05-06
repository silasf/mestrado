function [di, dt ] = obterDiDt(entrada,target)
% Formata a entrada e target para treino correto da Elman
% input
% entrada - sao as entradas selecionadas rede
% target - o mesmo que a entrada

 
    input = entrada;
    target = target;
    n = length(input);
    
    dtarget =target(1:n);
    dinput = input(1:n);
    dt = catsamplesNET(dtarget);
    di = catsamplesNET(dinput);
end