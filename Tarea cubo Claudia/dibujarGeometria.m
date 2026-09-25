function dibujarGeometria(ejes, puntos)
cla(ejes);
v = puntos;
caras = [1 2 3 4; 5 6 7 8; 1 2 6 5; 4 3 7 8; 1 4 8 5; 2 3 7 6];

patch(ejes, 'Vertices', [v(1,:)' v(2,:)' v(3,:)'], 'Faces', caras, ...
    'FaceColor', 'cyan', 'FaceAlpha', 0.6, 'EdgeColor', 'blue', 'LineWidth', 1.5);

grid(ejes, 'on');
axis(ejes, 'equal');
ejes.XLim = [-10 10]; 
ejes.YLim = [-10 10]; 
ejes.ZLim = [-10 10];
view(ejes, 35, 40);
end

%[appendix]{"version":"1.0"}
%---
