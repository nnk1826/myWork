% Counting neighbor cells with edge wrapping method - means 
% that the grid is treated as a toroidal surface where cells on the edges 
% are considered adjacent to the cells on the opposite edge

function liveNeighbors = countLiveNeighbors(gameGrid, row, col)
    [rows, cols] = size(gameGrid);
    liveNeighbors = 0;
    
    % Define the neighborhood offsets
    neighborOffsets = [
        -1,  0;  % Directly above
         1,  0;  % Directly below
         0, -1;  % To the left
         0,  1;  % To the right
        -1, -1;  % Diagonal upper left
        -1,  1;  % Diagonal upper right
         1, -1;  % Diagonal lower left
         1,  1   % Diagonal lower right
    ];
    
    % Iterate over the neighbor offsets
    for k = 1:size(neighborOffsets, 1)
        % Calculate wrapped indices
        % The - 1 and + 1 adjustments are made because MATLAB indices are 1-based, not 0-based
        neighborRow = mod(row + neighborOffsets(k, 1) - 1, rows) + 1;
        neighborCol = mod(col + neighborOffsets(k, 2) - 1, cols) + 1;
        
        % Accumulate the number of live neighbors
        liveNeighbors = liveNeighbors + gameGrid(neighborRow, neighborCol);
    end
end