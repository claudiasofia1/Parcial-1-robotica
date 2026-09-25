function [puntos, posFinal] = cinematicaGeometrica(L, theta)
% L = [L1, L2, L3, L4, L5]
% theta = [t1, t2, t3, t4, t5] en grados

t = deg2rad(theta);

% P0: Base en el origen
P0 = [0; 0; 0];

% P1: Altura del primer eslabón (eje Z)
P1 = [0; 0; L(1)];

% P2: Giro en Z (t1) y elevación en Y/Z (t2)
r2 = L(2) * cos(t(2));
P2 = P1 + [r2 * cos(t(1)); r2 * sin(t(1)); L(2) * sin(t(2))];

% P3: Extensión con t3
ang23 = t(2) + t(3);
r3 = L(3) * cos(ang23);
P3 = P2 + [r3 * cos(t(1)); r3 * sin(t(1)); L(3) * sin(ang23)];

% P4: Extensión con t4
ang234 = ang23 + t(4);
r4 = L(4) * cos(ang234);
P4 = P3 + [r4 * cos(t(1)); r4 * sin(t(1)); L(4) * sin(ang234)];

% P5: Extensión final con t5
ang2345 = ang234 + t(5);
r5 = L(5) * cos(ang2345);
P5 = P4 + [r5 * cos(t(1)); r5 * sin(t(1)); L(5) * sin(ang2345)];

puntos = [P0, P1, P2, P3, P4, P5];
posFinal = P5;
end