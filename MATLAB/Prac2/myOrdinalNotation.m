function ordinal = ordinalNotation(number)
    % Define the suffixes for different ordinal numbers
    suffixes = {'st', 'nd', 'rd'};
    
    % Input validation check
    if (number <= 0 || isnan(number))
        error ("Invalid input. Please try again!")
    end

    % Get the last digit of the number
    lastDigit = mod(number, 10);

    % Determine the suffix based on the last digit
    if lastDigit >= 1 && lastDigit <= 3 && number ~= 11 && number ~= 12 && number ~= 13
        ordinal = [num2str(number), suffixes{lastDigit}];
    else
        ordinal = [num2str(number), 'th'];
    end
end



