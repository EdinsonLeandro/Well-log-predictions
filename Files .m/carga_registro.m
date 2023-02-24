function REG=carga_registro(archivo)
% Funci�n que lee un registro de pozo.
% X = lectura_registro(ARCHIVO) arroja una matriz X cuyas columnas se
% corresponden con los registros de pozo provenientes de ARCHIVO (cuyo
% nombre debe escribirse entre comillas '' y con su propia extensi�n).
%
% Modificada de la funci�n "lectlasfilex.m".
% Obtenida de la Tesis (Landa, 2004). (Ver Referencias)
assy=fopen(archivo);
switch assy %
    case -1 %
        warndlg('El archivo no se encuentra en el Directorio adecuado',...
            'Error!');
    case 2 %
        warndlg('Error Estandar al abrir el archivo','Error!');
    otherwise % El archivo puede abrirse
        A=0; %Indicar� el momento en que se consiga la l�nea adecuada
            while A==0
            % Se lee una l�nea del archivo
                linlec=fgetl(assy);
            % Si es un archivo LAS, estos comienzan bien con un comentario
            % (#) o con un t�tulo (~)
                if strncmp(linlec,'~',1) || strncmp(linlec,'#',1)
                    % S�lo se toman en cuenta las l�neas que no corresponden
                    % a un comentario.
                    % ATENCI�N-MEJORAR!!!: NO TODOS LOS COMENTARIOS 
                    % EN UN .LAS VIENEN SEGUIDOS DE UN '~'.
                    if ~strcmp(linlec(1),'#')
                        if strncmp(linlec,'~A',2)
                            reg=fscanf(assy,'%f');
                            while isempty(reg);
                                fgets(assy);
                                reg=fscanf(assy,'%f');
                            end
                            A=1;
                            % Detecci�n del n�mero de registros
                            for i=2:size(reg);
                                R=reg(1)-reg(i);
                                    if R<=2;
                                        break
                                    end
                            end
                            % Orden final de los registros
                            REG=reshape(reg,i-1,[])';
                        end
                    end
                else
                    %El archivo no es de formato LAS
                    reg=fscanf(assy,'%f');
                    while isempty(reg);
                        fgets(assy);
                        reg=fscanf(assy,'%f');
                    end
                    A=1;
                    % Detecci�n del n�mero de registros
                    for i=2:size(reg);
                        R=reg(1)-reg(i);
                        if R<=2;
                            break
                        else
                            continue
                        end
                    end
                    % Orden final de los registros
                    REG=reshape(reg,i-1,[])';
                end
            end
end
end                         