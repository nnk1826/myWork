% Question 4, Practical 2

disp("Please enter the heights of 5 students! ")
for i = 1:1:5
    % Enter the heights of the sudents (in cm)
    fprintf('Height of the %i student: ', i);
    studentHeight(i) = input("");
end

% Display the heights of 5 students
for i = 1:1:5
    disp(studentHeight(i));
    disp("");
end
