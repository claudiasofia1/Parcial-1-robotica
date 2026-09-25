function dibujarBrazo(ejes, puntos)
cla(ejes);
hold(ejes, 'on');

X = puntos(1, :);
Y = puntos(2, :);
Z = puntos(3, :);

% Dibujar Eslabones con diferentes colores y grosor
coloresEslabones = {'#FF5722', '#2196F3', '#4CAF50', '#9C27B0', '#FFEB3B'};
for i = 1:5
    plot3(ejes, [X(i) X(i+1)], [Y(i) Y(i+1)], [Z(i) Z(i+1)], ...
        'Color', coloresEslabones{i}, 'LineWidth', 4);
end

% Dibujar Articulaciones (Puntos más anchos/grandes)
plot3(ejes, X(1), Y(1), Z(1), 'ko', 'MarkerSize', 12, 'MarkerFaceColor', 'k'); % Base
plot3(ejes, X(2:5), Y(2:5), Z(2:5), 'o', 'MarkerSize', 10, ...
    'MarkerEdgeColor', 'w', 'MarkerFaceColor', '#00BCD4'); % Articulaciones intermedias
plot3(ejes, X(6), Y(6), Z(6), 'h', 'MarkerSize', 14, ...
    'MarkerEdgeColor', 'r', 'MarkerFaceColor', '#E91E63'); % Efector final (Estrella)

% Configuración de la vista 3D
grid(ejes, 'on');
axis(ejes, 'equal');
ejes.XLim = [-200 200];
ejes.YLim = [-200 200];
ejes.ZLim = [0 300];
ejes.Color = [0.15 0.15 0.15]; % Fondo oscuro para resaltar colores
ejes.GridColor = [0.8 0.8 0.8];
view(ejes, 40, 25);
title(ejes, 'BRAZO ROBÓTICO 5 DOF', 'Color', 'w', 'FontSize', 12);
xlabel(ejes, 'Eje X', 'Color', 'w');
ylabel(ejes, 'Eje Y', 'Color', 'w');
zlabel(ejes, 'Eje Z', 'Color', 'w');
ejes.XColor = 'w'; ejes.YColor = 'w'; ejes.ZColor = 'w';
hold(ejes, 'off');
end