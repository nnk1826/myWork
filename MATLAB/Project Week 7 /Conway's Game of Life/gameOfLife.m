function gameOfLife
    disp("Welcome to Conway's Game of Life!");
    disp("Press Spacebar to pause and start the simulation!");
    disp("Press Q to exit the simulation");
    
    understood = false;
    while ~understood
        checkUnderstood = input("All checked? (Y/N) ","s");
        if (strcmpi(checkUnderstood, 'y') == 1)
            understood = true;
        else continue;
        end
    end

    % Set game elements
    FPS = 12;
    delay = 1 / FPS;
    exitGame = false;
    isPaused = false; % Initialize pause state

    % Initialize the grid size
    gridSize = 10;

    % Create the game grid
    gameGrid = fillGrid(gridSize);

    % Create the figure and set the KeyPressFcn callback
    hFig = createFigure(gridSize, gameGrid);
    set(hFig, 'KeyPressFcn', @keyPressFunction);

    % Main loop
    while ~exitGame
        if ~isPaused
            % Update the grid only if not paused
            gameGrid = updateGrid(gameGrid);
            
            % Update the figure
            hImg = findobj(hFig, 'Type', 'image');
            set(hImg, 'CData', gameGrid);
        end
        
        % Pause for a moment to control the speed of the simulation
        pause(delay);
    end

    function keyPressFunction(~, event)
        switch event.Key
            case 'space'
                isPaused = ~isPaused; % Toggle pause state
            case {'q','Q'}
                exitGame = true; % Set the flag to exit the main loop
                close(hFig); % Close the figure window
        end
    end
end
