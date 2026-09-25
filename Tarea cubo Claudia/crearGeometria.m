function matrizBase = crearGeometria(ancho, alto, prof)
x = ancho / 2; 
y = alto / 2; 
z = prof / 2;

matrizBase = [
    -x   x   x  -x  -x   x   x  -x;
    -y  -y   y   y  -y  -y   y   y;
    -z  -z  -z  -z   z   z   z   z;
    1   1   1   1   1   1   1   1
    ];
end

%[appendix]{"version":"1.0"}
%---
