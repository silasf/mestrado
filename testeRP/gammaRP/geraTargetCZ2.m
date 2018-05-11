function target=geraTargetCZ2(varargin)
% funcao para obter o target para redes neurais de previsao a partir da
% funcao conta zeros
% o diferencia para essa funcao eh a target gerada, a qual jah conta como
% oportunidade todas sequencias de zeros a partir do valor de oportunidade
% deseja, foi utiliza 70 sequencias de zeros consecultivos.
    
    % ociosidade    [1 0];
    % oportunidade  [0 1];
    
    entrada = varargin{1}; % entrada quantizada
    opo = varargin{2}; % numero de oportunidade desejada
    
    tam = length(entrada);
    a=ones(1,tam);
    semiTarg = conta_zeros2(entrada, opo);
    pontos = find(semiTarg==1);
    target = [a;semiTarg];
    
    t = length(pontos);
    for i=1:t % corrigi pontos com oportunidade para [0 1];
        target(1,pontos(i)) = 0;
        target(2,pontos(i)) = 1;
    end
end