% Check if the player is caught by anny enemies
function caught = isCaught(player_pos, enemy_positions)
    % Check if any enemies and the player are in same place
    caught = any(ismember(player_pos, enemy_positions, 'rows'));
end