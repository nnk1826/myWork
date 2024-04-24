function displayMaze(maze, player_pos, goal_pos, enemy_positions, num_lives, score)
    % Clear the current figure window to start fresh
    clf;

    % Use imagesc to display the maze 
    imagesc(maze);
    colormap(white);
    
    % Overlay player, goal, and enemies on the maze
    hold on;
    plot(player_pos(2), player_pos(1), 'ro', 'MarkerFaceColor', 'r'); % Player in red
    plot(goal_pos(2), goal_pos(1), 'go', 'MarkerFaceColor', 'g'); % Goal in green
    plot(enemy_positions(:, 2), enemy_positions(:, 1), 'bo', 'MarkerFaceColor', 'b'); % Enemies in blue
    hold off;

    % Adjust the axes for a cleaner look
    axis equal; % Keep aspect ratio to 1:1
    axis off; % Turn off the axis lines and labels
    title(sprintf('Maze Runner - Lives: %d - Score: %d', num_lives, score)); 
end
