function [puntos, posFinal] = cinematicaMatrizH(L, theta)
t = deg2rad(theta);

% Funciones auxiliares para matrices Rz, Ry y Traslación
rotz = @(ang) [cos(ang) -sin(ang) 0 0; sin(ang) cos(ang) 0 0; 0 0 1 0; 0 0 0 1];
roty = @(ang) [cos(ang) 0 sin(ang) 0; 0 1 0 0; -sin(ang) 0 cos(ang) 0; 0 0 0 1];
tras = @(dx, dy, dz) [1 0 0 dx; 0 1 0 dy; 0 0 1 dz; 0 0 0 1];

% Matriz Base
H0 = eye(4);

% Matrices de transformación de cada articulación
H1 = H0 * tras(0, 0, L(1)) * rotz(t(1));
H2 = H1 * roty(-t(2)) * tras(0, 0, L(2));
H3 = H2 * roty(-t(3)) * tras(0, 0, L(3));
H4 = H3 * roty(-t(4)) * tras(0, 0, L(4));
H5 = H4 * roty(-t(5)) * tras(0, 0, L(5));

% Extraer posiciones (X, Y, Z) de cada matriz
P0 = H0(1:3, 4);
P1 = H1(1:3, 4);
P2 = H2(1:3, 4);
P3 = H3(1:3, 4);
P4 = H4(1:3, 4);
P5 = H5(1:3, 4);

puntos = [P0, P1, P2, P3, P4, P5];
posFinal = P5;
end