% Maze Runner Game testing version

% Initialize game variables
maze_size = 49;
player_pos = [1, 1];
goal_pos = [maze_size, maze_size];
num_enemies = 10;
num_lives = 3;
score = 0;

gameFig = uifigure('Name', 'Maze Runner Game', 'Position', [100, 100, 800, 600], ...
                   'Color', [0.8, 0.8, 0.8], 'Resize', 'off');
movegui(gcf, 'center');

% Create game maze
maze = zeros(maze_size);

% Generate maze
maze = generateMaze(player_pos, maze);

% Place enemies
[maze, enemy_positions] = placeEnemies(num_enemies, maze_size, maze);

% Game loop
while true
    % Display game maze
    displayMaze(maze, player_pos, goal_pos, enemy_positions, num_lives, score);
    
    % Move enemies
    enemy_positions = moveEnemies(player_pos, maze, enemy_positions);
    
    % Check if player is caught by an enemy
    if isCaught(player_pos, enemy_positions)
        num_lives = num_lives - 1;
        player_pos = [1, 1];
        if num_lives == 0
            gameOver(score, gameFig);
            break;
        end
    end
    
    % Check if player reaches the goal
    if all(player_pos == goal_pos)
        score = score + 100;
        victory(score, gameFig);
        break;
    end

    % Get player input
    key = getkey;
    
    % Update player position based on input
    [player_pos, score] = updatePlayerPosition(key, player_pos, maze_size, maze, score);
    
    % Check if player quits the game
    if isempty(player_pos)
        break;
    end
end

% Function definitions

function maze = generateMaze(current_pos, maze)
    % Generate random maze using depth-first search algorithm
    directions = [0, 1; 0, -1; 1, 0; -1, 0];
    maze(current_pos(1), current_pos(2)) = 1;
    
    while ~isempty(directions)
        direction_index = randi(size(directions, 1));
        new_pos = current_pos + directions(direction_index, :);
        
        if all(new_pos >= 1) && all(new_pos <= size(maze, 1)) && maze(new_pos(1), new_pos(2)) == 0
            maze(current_pos(1), current_pos(2)) = 1;
            maze(new_pos(1), new_pos(2)) = 1;
            maze = generateMaze(new_pos, maze);
        end
        
        directions(direction_index, :) = [];    
    end
end

function [maze, enemy_positions] = placeEnemies(num_enemies, maze_size, maze)
    % Place enemies randomly in the maze
    enemy_positions = zeros(num_enemies, 2);
    for i = 1:num_enemies
        while true
            enemy_pos = [randi(maze_size), randi(maze_size)];
            if maze(enemy_pos(1), enemy_pos(2)) == 1 && ~ismember(enemy_pos, enemy_positions, 'rows')
                enemy_positions(i, :) = enemy_pos;
                break;
            end
        end
    end
end

function enemy_positions = moveEnemies(player_pos, maze, enemy_positions)
    % Move enemies towards the player
    for i = 1:size(enemy_positions, 1)
        enemy_pos = enemy_positions(i, :);
        direction = sign(player_pos - enemy_pos);

        new_pos = enemy_pos + direction;
        
        if all(new_pos >= 1) && all(new_pos <= size(maze, 1)) && maze(new_pos(1), new_pos(2)) == 1
            enemy_positions(i, :) = new_pos;
        end
    end
end

function caught = isCaught(player_pos, enemy_positions)
    % Check if the player is caught by an enemy
    caught = any(ismember(player_pos, enemy_positions, 'rows'));
end

function displayMaze(maze, player_pos, goal_pos, enemy_positions, num_lives, score)
    % Display game maze
    clf;
    imagesc(maze);
    colormap([1 0 1; 1 1 1]);
    hold on;
    plot(player_pos(2), player_pos(1), 'ro', 'MarkerFaceColor', 'r');
    plot(goal_pos(2), goal_pos(1), 'go', 'MarkerFaceColor', 'g');
    plot(enemy_positions(:, 2), enemy_positions(:, 1), 'bo', 'MarkerFaceColor', 'b');
    hold off;
    axis equal;
    axis([0.5, size(maze, 2)+0.5, 0.5, size(maze, 1)+0.5]);
    set(gca, 'XTick', 1:size(maze, 2), 'YTick', 1:size(maze, 1), 'GridLineStyle', '-', 'XTickLabel', [], 'YTickLabel', []);
    title(sprintf('Maze Runner - Lives: %d - Score: %d', num_lives, score));
end

function [player_pos, score] = updatePlayerPosition(key, player_pos, maze_size, maze, score)
    % Update player position based on input
    switch key
        case 30 % Up arrow
            new_pos = [player_pos(1)-2, player_pos(2)];
        case 31 % Down arrow
            new_pos = [player_pos(1)+2, player_pos(2)];
        case 28 % Left arrow
            new_pos = [player_pos(1), player_pos(2)-2];
        case 29 % Right arrow
            new_pos = [player_pos(1), player_pos(2)+2];
        case 'q'
            disp('Game Quit!');
            player_pos = [];
            return;
        otherwise
            new_pos = player_pos;
    end
    
    % Check if new position is valid
    if all(new_pos >= 1) && all(new_pos <= maze_size) && maze(new_pos(1), new_pos(2)) == 1
        player_pos = new_pos;
        score = score + 1;
    end
end

function gameOver(score, gameFig)
    % Display game over screen using a message box
    uialert(gameFig, sprintf('Game Over\nYour Score: %d', score), 'Game Over', ...
            'Icon', 'error');
end

function victory(score, gameFig)
    % Display victory screen using a message box
    uialert(gameFig, sprintf('Congratulations! You Won!\nYour Score: %d', score), 'Victory', ...
            'Icon', 'success');
end

function key = getkey
    % Get player input
    key = '';
    while isempty(key)
        if waitforbuttonpress
            key = get(gcf, 'CurrentCharacter');
        end
    end
end

function updateScore(score, gameFig)
    % Notify player about their score update
    uialert(gameFig, sprintf('New Score: %d', score), 'Score Update', ...
            'Icon', 'info');
end