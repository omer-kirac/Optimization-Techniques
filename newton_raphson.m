function [x_min, steps] = newton_raphson(f, grad_f, x0, epsilon, max_steps)
    if nargin < 5
        max_steps = 1000; % Default maximum steps if not provided
    end

    x = x0;
    steps = 0;
    while norm(grad_f(x)) > epsilon && steps < max_steps
        H = hessian(f, x);
        if rcond(H) < 1e-10 % Check if Hessian is invertible
            warning('Hessian is nearly singular at step %d', steps);
            break;
        end
        x = x - H\grad_f(x);
        steps = steps + 1;
        fprintf('Step %d: x = [%f, %f], grad_f = [%f, %f]\n', steps, x(1), x(2), grad_f(x));
    end
    x_min = x;

    if steps >= max_steps
        warning('Maximum number of steps reached without convergence.');
    end
end
