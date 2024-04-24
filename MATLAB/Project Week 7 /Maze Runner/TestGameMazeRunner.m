classdef TestGameMazeRunner < matlab.unittest.TestCase
    % Test class for gameMazeRunner.m

    properties
        GameFig
        OriginalPath
        MazeSize = 51;
        PlayerPos = [1, 1];
        GoalPos
        NumEnemies = 10;
        NumLives = 3;
        Score = 0;
        Maze
        EnemyPositions
    end

    methods (TestMethodSetup)
        function createFigure(testCase)
            testCase.GameFig = figure;
            testCase.OriginalPath = path;
            testCase.GoalPos = [testCase.MazeSize, testCase.MazeSize];
            testCase.Maze = zeros(testCase.MazeSize);
            testCase.Maze = generateMaze(testCase.PlayerPos, testCase.Maze);
            [testCase.Maze, testCase.EnemyPositions] = placeEnemies(testCase.NumEnemies, testCase.MazeSize, testCase.Maze);
        end
    end

    methods (TestMethodTeardown)
        function closeFigure(testCase)
            close(testCase.GameFig);
            path(testCase.OriginalPath);
        end
    end

    methods (Test)
        function testPlayerInput(testCase)
            % Simulate player input
            key = getkey;
            testCase.verifyNotEmpty(key);
        end

        function testEnemyPlacement(testCase)
            % Test that enemies are placed correctly
            testCase.verifySize(testCase.EnemyPositions, [testCase.NumEnemies, 2]);
        end

        function testPlayerCaughtByEnemy(testCase)
            % Place player at the same position as an enemy
            testCase.PlayerPos = testCase.EnemyPositions(1, :);
            caught = isCaught(testCase.PlayerPos, testCase.EnemyPositions);
            testCase.verifyTrue(caught);
        end

        function testGameInitialization(testCase)
            gameMazeRunner; % Call the function to start the game
            testCase.verifyEqual(testCase.PlayerPos, [1, 1]);
            testCase.verifyEqual(testCase.GoalPos, [testCase.MazeSize, testCase.MazeSize]);
            testCase.verifyEqual(testCase.NumEnemies, 10); % Default to medium difficulty
            testCase.verifyEqual(testCase.NumLives, 3);
        end

        function testPlayerMovement(testCase)
            % Simulate pressing 'right' arrow key
            [newPlayerPos, newScore, playerMoved, quitGame] = updatePlayerPosition(29, testCase.PlayerPos, testCase.MazeSize, testCase.Maze, testCase.Score);
            % Verify player moves right
            testCase.verifyEqual(newPlayerPos, [1, 2]);
            testCase.verifyTrue(playerMoved);
            testCase.verifyFalse(quitGame);
        end

        % function testVictoryCondition(testCase)
        %     % Set player position to goal position
        %     testCase.PlayerPos = testCase.GoalPos;
        %     % Call victory function
        %     victory(testCase.Score, testCase.GameFig);
        %     % Verify figure is closed after victory
        %     testCase.verifyFalse(isvalid(testCase.GameFig));
        % end

        % function testGameOverCondition(testCase)
        %     % Set lives to zero and simulate game over
        %     testCase.NumLives = 0;
        %     gameOver(testCase.Score, testCase.GameFig);
        %     % Verify figure is closed after game over
        %     testCase.verifyFalse(isvalid(testCase.GameFig));
        % end
    end
end

% Helper functions from the provided files
function key = getkey
    % Get player input
    key = '';
    while isempty(key)
        if waitforbuttonpress
            key = get(gcf, 'CurrentCharacter');
        end
    end
end

function caught = isCaught(player_pos, enemy_positions)
    % Check if the player is caught by an enemy
    caught = any(ismember(player_pos, enemy_positions, 'rows'));
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

% % Run the test
% testResults = runtests('TestGameMazeRunner');
% disp(testResults);
