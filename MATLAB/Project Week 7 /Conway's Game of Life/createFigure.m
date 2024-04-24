function hFig = createFigure(gridSize, gameGrid)
    % Create the figure with the specified properties
    hFig = figure('Name', "Conway's Game of Life", ...
           'NumberTitle','off', ...        
           'Color', [0.5 0.6 0.9], ...
           'Position', [0 0 750 750], ...
           'Resize', 'off', ...
           'ToolBar', 'none', ...
           'MenuBar', 'none', ...
           'WindowStyle', 'modal');
    movegui(hFig, "center");
    imagesc(gameGrid);
    colormap(summer);
    
    
    hold on;
    % Draw vertical grid
    for k = 0.5:1:gridSize+0.5
        line([k, k], [0.5, gridSize+0.5], 'Color', 'r', 'LineWidth', 2); 
    end
    % Draw horizontal grid
    for k = 0.5:1:gridSize+0.5
        line([0.5, gridSize+0.5], [k, k], 'Color', 'r', 'LineWidth', 2);  
    end
    hold off;    
    axis equal tight;
    axis off; % Turn off the axis lines and labels
end