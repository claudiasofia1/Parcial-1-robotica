function MainBrazoGUI()
    % Crear Ventana Principal
    fig = uifigure('Name', 'Simulación Cinemática Brazo 5 DOF', ...
                    'Position', [50 50 1100 650], 'Color', [0.1 0.1 0.1]);
                
    % Área de Gráfica 3D
    ax = uiaxes(fig, 'Position', [420 50 630 550]);
    
    % Panel de Control
    panel = uipanel(fig, 'Title', 'Parámetros de Entrada', 'Position', [20 20 380 610], ...
                    'BackgroundColor', [0.18 0.18 0.18], 'ForegroundColor', 'w');
                
    % Inputs de Longitudes (L1 a L5)
    uilabel(panel, 'Position', [15 550 120 22], 'Text', 'Longitudes (mm):', 'FontColor', 'w', 'FontWeight', 'bold');
    l_inputs = gobjects(1,5);
    valoresDefectoL = [50, 35, 30, 25, 20];
    for i = 1:5
        uilabel(panel, 'Position', [15 + (i-1)*70, 520, 25, 22], 'Text', ['L' num2str(i)], 'FontColor', 'w');
        l_inputs(i) = uieditfield(panel, 'numeric', 'Position', [35 + (i-1)*70, 520, 45, 22], ...
                                 'Value', valoresDefectoL(i), 'ValueChangedFcn', @(src,e) actualizar());
    end
    
    % Selector de Método (Cinemática Geométrica / Matriz H)
    uilabel(panel, 'Position', [15 475 150 22], 'Text', 'Método de Solución:', 'FontColor', 'w', 'FontWeight', 'bold');
    metodoSelect = uidropdown(panel, 'Position', [160 475 190 25], ...
                             'Items', {'Cinemática Geométrica', 'Matriz de Transformación H'}, ...
                             'ValueChangedFcn', @(src,e) actualizar());
                         
    % Visualización de Posición Final (X, Y, Z)
    uilabel(panel, 'Position', [15 425 200 22], 'Text', 'Posición Efector Final (mm):', 'FontColor', 'w', 'FontWeight', 'bold');
    lblX = uilabel(panel, 'Position', [20 395 100 22], 'Text', 'X: 0.00', 'FontColor', '#00E676', 'FontWeight', 'bold');
    lblY = uilabel(panel, 'Position', [140 395 100 22], 'Text', 'Y: 0.00', 'FontColor', '#00E676', 'FontWeight', 'bold');
    lblZ = uilabel(panel, 'Position', [260 395 100 22], 'Text', 'Z: 0.00', 'FontColor', '#00E676', 'FontWeight', 'bold');
    
    % Sliders para Ángulos (Theta 1 a Theta 5)
    uilabel(panel, 'Position', [15 350 150 22], 'Text', 'Ángulos (Grados):', 'FontColor', 'w', 'FontWeight', 'bold');
    sliders = gobjects(1,5);
    lblAngulos = gobjects(1,5);
    rangos = [-180 180; -90 90; -135 135; -90 90; -180 180];
    
    for i = 1:5
        posY = 320 - (i-1)*55;
        uilabel(panel, 'Position', [15 posY 60 22], 'Text', ['Theta ' num2str(i)], 'FontColor', 'w');
        lblAngulos(i) = uilabel(panel, 'Position', [320 posY 40 22], 'Text', '0°', 'FontColor', 'w');
        sliders(i) = uislider(panel, 'Position', [85 posY+10 220 3], ...
                             'Limits', rangos(i,:), 'Value', 0, ...
                             'ValueChangedFcn', @(src,e) actualizar());
    end
    
    % Función de Actualización
    function actualizar()
        % Leer Longitudes
        L = zeros(1,5);
        for k = 1:5, L(k) = l_inputs(k).Value; end
        
        % Leer Ángulos
        theta = zeros(1,5);
        for k = 1:5
            theta(k) = sliders(k).Value;
            lblAngulos(k).Text = [num2str(round(theta(k))) '°'];
        end
        
        % Calcular según el método seleccionado
        if strcmp(metodoSelect.Value, 'Cinemática Geométrica')
            [puntos, posFinal] = cinematicaGeometrica(L, theta);
        else
            [puntos, posFinal] = cinematicaMatrizH(L, theta);
        end
        
        % Actualizar Etiquetas de Coordenadas
        lblX.Text = sprintf('X: %.2f', posFinal(1));
        lblY.Text = sprintf('Y: %.2f', posFinal(2));
        lblZ.Text = sprintf('Z: %.2f', posFinal(3));
        
        % Dibujar en Gráfica 3D
        dibujarBrazo(ax, puntos);
    end

    % Renderizado inicial
    actualizar();
end