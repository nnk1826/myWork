function enemy_positions = moveEnemies(player_pos, maze, enemy_positions, player_moved)
    %If the player hasn't moved, the enemy stays still
    if ~player_moved
        return;
    end

    % Move enemies towards the player using Manhattan distance
    for i = 1:size(enemy_positions, 1)
        enemy_pos = enemy_positions(i, :);
        % Calculate the differences in both dimensions
        diff = player_pos - enemy_pos;
        
        % Determine the direction to move based on the larger absolute difference
        if abs(diff(1)) > abs(diff(2))
            % Move in the y-direction
            step = sign(diff(1));
            new_pos = enemy_pos + [step, 0];
        else
            % Move in the x-direction
            step = sign(diff(2));
            new_pos = enemy_pos + [0, step];
        end

        % Check if the new position is within the maze bounds
        if all(new_pos >= 1) && all(new_pos <= size(maze, 1))
            % Check if the new position is a path and not currently occupied by another enemy
            if maze(new_pos(1), new_pos(2)) == 1 && ~ismember(new_pos, enemy_positions, 'rows')
                % Update the enemy's position
                enemy_positions(i, :) = new_pos;
            end
        end
    end
end