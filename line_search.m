function alpha = line_search(f, grad_f, x, d)
    alpha = 1;
    rho = 0.8;
    c = 1e-4;
    while f(x + alpha * d) > f(x) + c * alpha * grad_f(x)' * d
        alpha = alpha * rho;
    end
end
