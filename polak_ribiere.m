function [x_min, steps] = polak_ribiere(f, grad_f, x0, epsilon, max_steps)
    if nargin < 5
        max_steps = 1000; % Default maximum steps if not provided
    end

    x = x0;
    r = -grad_f(x);
    d = r;
    steps = 0;
    while norm(grad_f(x)) > epsilon && steps < max_steps
        alpha = line_search(f, grad_f, x, d);
        x_new = x + alpha * d;
        r_new = -grad_f(x_new);
        beta = max((r_new' * (r_new - r)) / (r' * r), 0);
        d = r_new + beta * d;
        x = x_new;
        r = r_new;
        steps = steps + 1;
        fprintf('Step %d: x = [%f, %f], grad_f = [%f, %f], alpha = %f\n', steps, x(1), x(2), grad_f(x), alpha);
    end
    x_min = x;

    if steps >= max_steps
        warning('Maximum number of steps reached without convergence.');
    end
end
