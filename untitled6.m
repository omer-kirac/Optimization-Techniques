% Plot the function surface
figure;
surf(x, y, z);
hold on;
title('Optimization Paths');
xlabel('x');
ylabel('y');
zlabel('f(x, y)');

% Define initial guesses
initial_points = 3;
colors = ['r', 'g', 'b'];

for i = 1:initial_points
    % Generate random initial point
    x0 = 4 * rand(2,1) - 2;
    
    % Call optimization method (Fletcher-Reeves)
    [x_min, steps] = fletcher_reeves(f, grad_f, x0, epsilon, max_steps);
    
    % Plot optimization path
    plot3(x_min(1), x_min(2), f(x_min), 'ko', 'MarkerSize', 8, 'MarkerFaceColor', colors(i));
    plot3(steps(:,1), steps(:,2), f(steps), 'Color', colors(i));
end

legend('Function', 'Initial Guess', 'Optimization Path 1', 'Optimization Path 2', 'Optimization Path 3');
hold off;
