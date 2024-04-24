classdef TidemanVotingSystemTest < matlab.unittest.TestCase
    
    properties
        candidates
        votes
        candidate_count
        voter_count
        preferences
        locked
        pairs
        pair_count
    end
    
    methods (TestMethodSetup)
        function setup(testCase)
            testCase.candidates = {'Alice', 'Bob', 'Charlie'};
            testCase.votes = [
                1, 2, 3;  % Voter 1: Alice > Bob > Charlie
                2, 3, 1;  % Voter 2: Bob > Charlie > Alice
                3, 1, 2   % Voter 3: Charlie > Alice > Bob
            ];
            testCase.candidate_count = numel(testCase.candidates);
            testCase.voter_count = size(testCase.votes, 1);
            testCase.preferences = zeros(testCase.candidate_count);
            testCase.locked = false(testCase.candidate_count);
            testCase.pairs = struct('winner', cell(testCase.candidate_count * (testCase.candidate_count - 1) / 2, 1), ...
                                    'loser', cell(testCase.candidate_count * (testCase.candidate_count - 1) / 2, 1));
            testCase.pair_count = 3;
        end
    end
    
    methods (Test)
        function testRecordPreferences(testCase)
            for i = 1:testCase.voter_count
                testCase.preferences = record_preferences(testCase.votes(i, :), testCase.preferences, testCase.candidate_count);
            end
            expected_preferences = [0, 2, 1; 1, 0, 2; 2, 1, 0];
            testCase.verifyEqual(testCase.preferences, expected_preferences, 'Preferences did not match expected.');
        end
        
        function testAddAndSortPairs(testCase)
            [testCase.pairs, updatedPairCount] = add_pairs(testCase.preferences, testCase.pairs, testCase.candidate_count, testCase.pair_count);
            testCase.pair_count = updatedPairCount;  % Update testCase.pair_count with the returned value
            testCase.verifyEqual(testCase.pair_count, 3, 'Incorrect number of pairs.');
        end

    end
end

% Include the functions
function preferences = record_preferences(ranks, preferences, candidate_count)
    for i = 1:candidate_count
        for j = i+1:candidate_count
            preferences(ranks(i), ranks(j)) = preferences(ranks(i), ranks(j)) + 1;
        end
    end
end

function [pairs, pair_count] = add_pairs(preferences, pairs, candidate_count, pair_count)
    for i = 1:candidate_count
        for j = i+1:candidate_count
            if preferences(i, j) > 0
                pair_count = pair_count + 1;
                pairs(pair_count).winner = i;
                pairs(pair_count).loser = j;
            elseif preferences(i, j) < 0
                pair_count = pair_count + 1;
                pairs(pair_count).winner = j;
                pairs(pair_count).loser = i;
            end
        end
    end
    return; 
end
