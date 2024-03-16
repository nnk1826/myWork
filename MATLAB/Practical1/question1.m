% disp("Let's create a rectangular-shaped cardboard container, please enter its sides");
% height = input("Please enter your height: ");
% length = input("Please enter your length: ");
% depth  = input("Please enter your depth: ");
% volume = height * length * depth;
% disp(['Your container volume is: ', num2str(volume)]);

%This program calculates some properties of a circle and a sphere
% r = input('Enter a radius in centimetres: ');
% 
% area = 3.14 * r ^ 2;
% c = 2 * 3.14 * r;
% fprintf('A circle with radius %.3f cm has area %.3f cm^2', r, area);
% fprintf(' and circumference %.3f cm\n', c);
% volume = 4/3 * 3.14 * r ^ 3;
% fprintf('A sphere with radius %.3f cm has volume %.3f cm^3', r, volume);

% n = input("Set a number: ");
% for i = [n:-1:1]
%         fprintf("%.f ",i);
%         pause(1);
% end
% disp("blast off");

for i = [100:-1:1]
    if (mod(i,2) == 0)
        fprintf("%.f ", i);
    end
end
