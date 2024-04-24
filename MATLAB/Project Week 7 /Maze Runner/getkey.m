% Get player input
function key = getkey
    key = '';
    while isempty(key)
        if waitforbuttonpress % Wait until a key is pressed
            key = get(gcf, 'CurrentCharacter'); % Return the recent key pressed
        end
    end
end