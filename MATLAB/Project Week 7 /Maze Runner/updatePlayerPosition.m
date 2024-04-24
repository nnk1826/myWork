% Move the player
function [player_pos, score, player_moved, quit_game] = updatePlayerPosition(key, player_pos, maze_size, maze, score)
    % Check if the player has moved properly
    player_moved = false;
    quit_game = false;
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
        case {'q', 'Q'} % Check for both 'q' and 'Q'
            disp('Game Quit!');
            disp("Thank you for playing!");
            quit_game = true;
            return;
        otherwise
            disp('Invalid key pressed. No action taken.');
            return; % Exit the function if the key is not recognized
    end
    
    % Check if new position is valid
    if all(new_pos >= 1) && all(new_pos <= maze_size) && maze(new_pos(1), new_pos(2)) == 1
        player_pos = new_pos;
        player_moved = true; % Player has moved properly
        score = score + 1;
    end
end