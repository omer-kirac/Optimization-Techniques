function [x_min, steps] = bfgs(f, grad_f, x0, epsilon)
    x = x0;
    H = eye(length(x0));
    steps = 0;
    while norm(grad_f(x)) > epsilon
        d = -H * grad_f(x);
        alpha = line_search(f, x, d); % Custom function for line search
        x_new = x + alpha * d;
        s = x_new - x;
        y = grad_f(x_new) - grad_f(x);
        rho = 1 / (y' * s);
        H = (eye(length(x0)) - rho * s * y') * H * (eye(length(x0)) - rho * y * s') + rho * (s * s');
        x = x_new;
        steps = steps + 1;
    end
    x_min = x;
end
