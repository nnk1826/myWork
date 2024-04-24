% Prompt Victory screen
function victory(score, gameFig)
    % Close the game figure
    close(gameFig);

    % Create a custom uifigure for the victory dialog
    fig = uifigure('Name', 'Victory', 'Position', [200, 200, 600, 300], 'Resize', 'off');
    movegui(fig, 'center');
    
    % Display victory message
    lbl = uilabel(fig, ...
                  'Text', sprintf('Congratulations! You Won!\nYour Score: %d', score), ...
                  'Position', [100, 150, 400, 100], ...
                  'HorizontalAlignment', 'center', ...
                  'FontSize', 25, ...
                  'FontName', 'Arial'); 
    
    % Create a button that closes the figure
    btn = uibutton(fig, ...
                   'Text', 'OK', ...
                   'Position', [200, 40, 200, 50], ...
                   'ButtonPushedFcn', @(btn,event) closeFigure(fig), ...
                  'FontSize', 30, ...
                  'FontName', 'Arial');
end

function closeFigure(fig)
    % Close the figure window
    delete(fig);
end