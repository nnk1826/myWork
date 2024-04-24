% Create cells for the simulation
function cell_state = fillGrid(gridSize)
    % Generate random cells
    rows = gridSize;
    cols = gridSize;
    for i = 1:rows
        for j = 1:cols
            cell_state(i,j) = (randi(2) == 2) ;
        end
    end

    %% Generate cell in glider pattern
    % cell_state = zeros(gridSize, gridSize);
    % gliderPattern = [0 1 0; 0 0 1; 1 1 1];
    % startRow = 2; % Choose a starting position that fits within the grid
    % startCol = 2;
    % cell_state(startRow:startRow+2, startCol:startCol+2) = gliderPattern;
end