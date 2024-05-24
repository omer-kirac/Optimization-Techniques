function H = hessian(f, x)
    n = length(x);
    H = zeros(n);
    epsilon = 1e-5;
    fx = f(x);
    for i = 1:n
        for j = 1:n
            if i == j
                x_ij = x;
                x_ij(i) = x(i) + epsilon;
                x_ij2 = x;
                x_ij2(i) = x(i) - epsilon;
                H(i, j) = (f(x_ij) - 2 * fx + f(x_ij2)) / (epsilon^2);
            else
                x_ij1 = x;
                x_ij2 = x;
                x_ij1([i j]) = x([i j]) + epsilon;
                x_ij2([i j]) = x([i j]) - epsilon;
                H(i, j) = (f(x_ij1) - f(x + epsilon * (i == j)) - f(x + epsilon * (j == i)) + fx) / (epsilon^2);
            end
        end
    end
end
