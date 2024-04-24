% Update grid every frame to simulate the game
function newGrid = updateGrid(gameGrid)
    % Get the size of the grid
    [rows, cols] = size(gameGrid);

    % Initialize the new grid
    newGrid = zeros(rows, cols);

    % Loop over each cell in the grid
    for i = 1:rows
        for j = 1:cols
            % Count the alive neighbors with edge wrapping
            aliveNeighbors = countLiveNeighbors(gameGrid, i, j);
            
            % Apply the rules of the Game of Life
            if gameGrid(i, j) == 1 % If the cell is alive
                if aliveNeighbors < 2
                    newGrid(i, j) = 0; % Die by underpopulation
                elseif aliveNeighbors == 2 || aliveNeighbors == 3
                    newGrid(i, j) = 1; % Continue living
                else
                    newGrid(i, j) = 0; % Die by overpopulation
                end
            elseif gameGrid(i, j) == 0 % If the cell is dead
                if aliveNeighbors == 3
                    newGrid(i, j) = 1; % Become alive by reproduction
                else
                    newGrid(i, j) = 0; % Remain dead
                end
            end
        end
    end
end