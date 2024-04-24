% Place enemies in the mze
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