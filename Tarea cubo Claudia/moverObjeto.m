function matrizNueva = moverObjeto(matrizActual, eje, distancia)
T = eye(4);
if eje == 'x'
    T(1,4) = distancia;
elseif eje == 'y'
    T(2,4) = distancia;
elseif eje == 'z'
    T(3,4) = distancia;
end
matrizNueva = T * matrizActual;
end

%[appendix]{"version":"1.0"}
%---
