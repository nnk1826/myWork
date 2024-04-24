% Max number of candidates
MAX = 9;

% preferences(i,j) is number of voters who prefer i over j
preferences = zeros(MAX, MAX);

% locked(i,j) means i is locked in over j
locked = false(MAX, MAX);

% Each pair has a winner, loser
pairs = struct('winner', cell(MAX * (MAX - 1) / 2, 1), 'loser', cell(MAX * (MAX - 1) / 2, 1));

candidates = cell(1, MAX);
pair_count = 0;
candidate_count = 0;

% Populate array of candidates
candidate_count = input('Enter the number of candidates: ');
if candidate_count > MAX
    error('Maximum number of candidates is %i\n', MAX);
end
% Input candidate(s)' name
for i = 1:candidate_count
    unique = false;
    while ~unique
        candidate_name = strtrim(input(sprintf('Candidate %i name: ', i), 's'));
        if ~any(strcmpi(candidates(1:i-1), candidate_name))
            candidates{i} = candidate_name;
            unique = true;
        else
            fprintf('Candidate name must be unique. Please enter a different name.\n');
        end
    end
end

% Clear graph of locked in pairs
locked(:) = false;

pair_count = 0;
voter_count = input('Number of voters: ');

% Query for votes
for i = 1:voter_count
    % ranks(i) is voter's ith preference
    fprintf("Vote %i \n",i);
    ranks = zeros(1, candidate_count);

    % Query for each rank
    for j = 1:candidate_count
        valid = false;
        while ~valid
            name = strtrim(input(sprintf('Rank %i: ', j), 's'));
            [valid, updatedRanks] = vote(j, name, ranks, candidates, candidate_count);
            if ~valid
                fprintf('Invalid vote: %s. Please enter a valid candidate name that has not been chosen yet.\n', name);
            else
                ranks = updatedRanks; % Update ranks with the returned value
            end
        end
    end
    fprintf("\n");
    preferences = record_preferences(ranks, preferences, candidate_count);
end

[pairs, pair_count] = add_pairs(preferences, pairs, candidate_count, pair_count);
preferences = sort_pairs(pairs, preferences, pair_count);
locked = lock_pairs(pairs, locked, candidate_count, pair_count);
print_winner(candidates, locked, candidate_count);

% Function implementations

% Checking valid names and update ranks for each candidate
function [valid, ranks] = vote(rank, name, ranks, candidates, candidate_count)
    valid = false;
    name = strtrim(lower(name)); % Normalize input
    candidateIndex = find(strcmpi(candidates, name)); % Find the index of the candidate

    if isempty(candidateIndex)
        return; % If candidate name is not found, return invalid
    end

    if any(ranks == candidateIndex)
        return; % If this candidate has already been voted for, return invalid
    end

    for i = 1:candidate_count
        if strcmpi(name, candidates{i}) % Compare with case insensitivity
            ranks(rank) = i;
            valid = true;
            break;
        end
    end
end

% Update preferences given one voter's rank
function preferences = record_preferences(ranks, preferences, candidate_count)
    for i = 1:candidate_count
        for j = i+1:candidate_count
            preferences(ranks(i), ranks(j)) = preferences(ranks(i), ranks(j)) + 1;
        end
    end
end

% Record pairs of candidates where one is preferred over the other
function [pairs, pair_count] = add_pairs(preferences, pairs, candidate_count, pair_count)
    for i = 1:candidate_count
        for j = i+1:candidate_count
            strength = preferences(i, j) - preferences(j, i); 
            % Check which candidate is more preferred in a pair
            if strength > 0
                pair_count = pair_count + 1;
                pairs(pair_count).winner = i;
                pairs(pair_count).loser = j;
            elseif strength < 0
                pair_count = pair_count + 1;
                pairs(pair_count).winner = j;
                pairs(pair_count).loser = i;
            end
        end
    end
end

% Sort pairs in decreasing order by strength of victory
function preferences = sort_pairs(pairs, preferences, pair_count)
    % Comparing 2 pairs
    for i = 1:pair_count
        strongest = preferences(pairs(i).winner, pairs(i).loser) - preferences(pairs(i).loser, pairs(i).winner);
        strongest_index = i;
        for j = i+1:pair_count
            current_strongest = preferences(pairs(j).winner, pairs(j).loser) - preferences(pairs(j).loser, pairs(j).winner);

            if strongest < current_strongest
                strongest = current_strongest;
                strongest_index = j;
            end
        end
        
        % Sorting stronger pair to weaker pair using a buffer
        if strongest_index ~= i
            buffer = pairs(i);
            pairs(i) = pairs(strongest_index);
            pairs(strongest_index) = buffer;
        end
    end
end

% Lock pairs into the candidate graph in order, without creating cycles
function locked = lock_pairs(pairs, locked, candidate_count, pair_count)
    for i = 1:pair_count
        if ~cycle(pairs(i).winner, pairs(i).loser, locked, candidate_count)
            locked(pairs(i).winner, pairs(i).loser) = true;
        end
    end
end

% Print the winner of the vote
function print_winner(candidates, locked, candidate_count)
    for i = 1:candidate_count
        isWinner = true;
        for j = 1:candidate_count
            if locked(j, i)
                isWinner = false;
                break;
            end
        end
        if isWinner
            fprintf('The winner of the vote is: %s\n', candidates{i});
        end
    end
end

% Check if there is a cycle between candidates
function has_cycle = cycle(winner, loser, locked, candidate_count)
    % If the loser candidate and the winner candidate is the same
    if loser == winner
        has_cycle = true;
        return;
    end

    % Loop through every candidate to check each pair
    for i = 1:candidate_count
        % If the loser candidate lose to candidate "i"
        if locked(loser, i)

            % Recursively check if candidate "i" loses to any other
            % candidate
            if cycle(winner, i, locked, candidate_count)
                has_cycle = true; % Create a cycle
                return;
            end
        end
    end
    % If there is no cycle throughout candidate list
    has_cycle = false;
end