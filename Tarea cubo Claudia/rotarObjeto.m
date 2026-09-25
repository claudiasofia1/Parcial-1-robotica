function matrizNueva = rotarObjeto(matrizActual, angulo, eje, modo)
R = eye(4);
if eje == 'x'
    R(2:3, 2:3) = [cosd(angulo) -sind(angulo); sind(angulo) cosd(angulo)];
elseif eje == 'y'
    R(1:3, 1:3) = [cosd(angulo) 0 sind(angulo); 0 1 0; -sind(angulo) 0 cosd(angulo)];
elseif eje == 'z'
    R(1:2, 1:2) = [cosd(angulo) -sind(angulo); sind(angulo) cosd(angulo)];
end

if strcmp(modo, 'Extrinseca')
    matrizNueva = R * matrizActual;
else
    c = mean(matrizActual(1:3, :), 2);
    T_origen = eye(4); T_origen(1:3, 4) = -c;
    T_regreso = eye(4); T_regreso(1:3, 4) = c;
    matrizNueva = T_regreso * R * T_origen * matrizActual;
end
end

%[appendix]{"version":"1.0"}
%---
