function r=indice(X,p)
% r = indice(X,p) busca el n�mero de fila (posici�n) en que se encuentra
% el n�mero "p" dentro del vector X (siendo un vector fila o columna)

% i=1;
% while X(i) ~= p
%     i=i+1;
% end
% r=i;

% ATENCI�N-MEJORAR!!!: EVALUAR BIEN EL FUNCIONAMIENTO DE ESTA FUNCI�N. SE
% UTILIZA DENTRO DE LA FUNCI�N DE GRAFICA_REGISTROS
r=0;
for i=1:size(X)
    if X(i)==p
        r=i;
    end
end

if r==0
    disp('Este elemento no se encuentra en el vector')
end