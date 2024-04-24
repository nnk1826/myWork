classdef GameOfLifeTest < matlab.unittest.TestCase

    methods (Test)
        function testInitialGrid(testCase)
            % Test the initial grid setup to ensure it contains the correct glider pattern.
            gridSize = 10;
            expectedGrid = zeros(gridSize, gridSize);
            gliderPattern = [0 1 0; 0 0 1; 1 1 1];
            startRow = 2; % Choose a starting position that fits within the grid
            startCol = 2;
            expectedGrid(startRow:startRow+2, startCol:startCol+2) = gliderPattern;

            actualGrid = fillGrid(gridSize);

            testCase.verifyEqual(actualGrid, expectedGrid, ...
                'Initial grid does not match expected glider configuration.');
        end

        function testUpdateGrid(testCase)
            % Test the updateGrid function to ensure it correctly updates the grid.
            initialGrid = [0 0 0 0 0;
                           0 0 1 0 0;
                           0 0 1 0 0;
                           0 0 1 0 0;
                           0 0 0 0 0];

            expectedGrid = [0 0 0 0 0;
                            0 0 0 0 0;
                            0 1 1 1 0;
                            0 0 0 0 0;
                            0 0 0 0 0];

            actualGrid = updateGrid(initialGrid);

            testCase.verifyEqual(actualGrid, expectedGrid, ...
                'Updated grid does not match expected configuration after one update.');
        end
    end
end
% results = runtests('GameOfLifeTest');results = runtests('GameOfLifeTest');

