% Create a maze for the game 
function maze = generateMaze(current_pos, maze)
    % Generate random maze using depth-first search algorithm
    directions = [0, 1; 0, -1; 1, 0; -1, 0];
    maze(current_pos(1), current_pos(2)) = 1;
    
    % Recursively check random move to build the maze
    while ~isempty(directions)
        direction_index = randi(size(directions, 1));
        new_pos = current_pos + directions(direction_index, :);
        
        % Check if new position is within the bounds of the maze
        if all(new_pos >= 1) && all(new_pos <= size(maze, 1)) && maze(new_pos(1), new_pos(2)) == 0
            maze(current_pos(1), current_pos(2)) = 1;
            maze(new_pos(1), new_pos(2)) = 1;
            maze = generateMaze(new_pos, maze);
        end
        
        % Remove the move that is already checked
        directions(direction_index, :) = [];    
    end
end