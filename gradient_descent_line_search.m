function [x_min, steps] = gradient_descent_line_search(f, grad_f, x0, epsilon, max_steps)
    if nargin < 5
        max_steps = 1000; % Default maximum steps if not provided
    end

    x = x0;
    steps = 0;
    while norm(grad_f(x)) > epsilon && steps < max_steps
        d = -grad_f(x); % Descent direction
        alpha = line_search(f, grad_f, x, d);
        x = x + alpha * d;
        steps = steps + 1;
        fprintf('Step %d: x = [%f, %f], grad_f = [%f, %f], alpha = %f\n', steps, x(1), x(2), grad_f(x), alpha);
    end
    x_min = x;

    if steps >= max_steps
        warning('Maximum number of steps reached without convergence.');
    end
end
