function [z,nz]=conta_zeros2(entrada,zconsec)
% Entradas
% entrada - utiliza entradaQuantizada
% zconsec - numeros de zeros consecutivos que caracterizando uma
% oportunidade
% Saida
% como saida gera uma target marcando as possiveis oportunidades

%chamada da funcao
% contador de zeros / gerador de target de oportunidades
% target=conta_zeros2(entrada_Quantizada, zeros_consecutivos);

n=numel(entrada);       % Número de amostras da entrada quantizada
nz=zeros(1,n);          % Histograma da contagem do numero de zeros para caracterizar o canal
z=zeros(1,n);           % Target gerado

numz=0;                 % inicia o contador de zeros
ind=1;                  % índice inicial
for i=1:n               % para todas as amostras
    if (entrada(i)==0)  % se o sinal quantizado é 0
       numz=numz+1;     % incrementa o contador
    else                % caso o sinal quantizado seja 1
        nz(1,numz+1)=nz(1,numz+1)+1;    % incrementa o bias do histograma
        if(numz>=zconsec)               % se contador de zeros > número para oportunidade
            indice(1,ind)=i-numz;       % armazena o local do início do intervalo de oportunidade
            indice(2,ind)=numz;         % armazena o local de fim do intervalo de oportunidade
            ind=ind+1;                  % incrementa o índice
        end
        numz=0;         % zera o contador de zeros
    end
end

if(numz>=zconsec)           % para o considerar o último intervalo
    %correcao adcionei +1 no indice, isso porque estava marcando no local
    %errado, acontecendo apenas na ultima parte
   indice(1,ind)=i-numz+1;    % local de inicio do último intervalo
   indice(2,ind)=numz;      % local de final do último intervalo
   ind=ind+1;               % incrementa o índice
end

        
for i=1:ind-1                   % para todos os índices
    z(1,(indice(1,i)))=1;       % seta o local de início do intervalo como oportunidade
%     for j=0:indice(2,i)-1
%         z(1,(indice(1,i)+j))=1;
%     end
end

z(1,(indice(1,1))) = 0;

end
