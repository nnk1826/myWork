% Maze Runner Game
function gameMazeRunner
    disp("Welcome to Maze Runner. Reach to the goal at the bottom of the screen to win the game!");
    disp("Press Q to quit the game.");

   % Select difficulty
    difficulty = input('Choose your difficulty (Easy, Medium, Hard): ', 's');
    difficulty = lower(difficulty);  % Convert the input to lowercase ignoring whatever input fonts to check cases
    
    % Initialize game elements based on difficulty
    maze_size = 51;
    player_pos = [1, 1];
    goal_pos = [maze_size, maze_size];
    score = 0;
    
    switch difficulty
        case 'easy'
            num_enemies = 5;
            num_lives = 5;
        case 'medium'
            num_enemies = 10;
            num_lives = 3;
        case 'hard'
            num_enemies = 15;
            num_lives = 1;
        otherwise
            disp('Invalid difficulty. Defaulting to Medium.');
            num_enemies = 10;
            num_lives = 3;
    end
    
    % Create the main game window
    gameFig = figure('Name', 'Maze Runner Game', ...
                     'NumberTitle','off', ...
                     'Position', [1, 1, 600, 600], ...
                     'Color', [0.9290 0.6940 0.1250], ...
                     'Resize', 'off', ...
                     'ToolBar', 'none', ...
                     'MenuBar', 'none', ...
                     'WindowStyle', 'modal');
    movegui(gameFig, 'center');
    
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
        
        % Get player input
        key = getkey;

        % Update player position based on input
        [player_pos, score, player_moved, quit_game] = updatePlayerPosition(key, player_pos, maze_size, maze, score);

        % Check if the user has chosen to quit the game
        if quit_game
            delete(gameFig);  % Delete the game figure
            break;            % Break out of the game loop
        end

        % Move enemies
        enemy_positions = moveEnemies(player_pos, maze, enemy_positions, player_moved);
        
        % Check if player is caught by an enemy
        if isCaught(player_pos, enemy_positions)
            num_lives = num_lives - 1;
            score = 0;
            player_pos = [1, 1];
            if num_lives == 0
                gameOver(score, gameFig);
                break;
            end
        end
        
        % Check if player reaches the goal
        if all(player_pos == goal_pos)
            victory(score, gameFig);
            break;
        end
    end
end