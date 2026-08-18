function tableprint(x, y)

[~, ~, ~, ~, ~, alpha, beta, gamma, delta, epsilon, zeta, eta, theta] = regressaolinear(x, y);

function s = fmt(x)
    if abs(x) < 1e-4 || abs(x) >= 1e4
        s = sprintf('%.4g', x);
    else
        s = sprintf('%.4f', x);
    end
end

fprintf('(xi) = ');
c = arrayfun(@fmt, alpha, 'UniformOutput', false);
fprintf('%s ', c{:});
fprintf('\n');

fprintf('Sum(xi) = %s\n', fmt(sum (alpha)));

fprintf('(yi) = ');
c = arrayfun(@fmt, beta, 'UniformOutput', false);
fprintf('%s ', c{:});
fprintf('\n');

fprintf('Sum(yi) = %s\n', fmt(sum (beta)));

fprintf('(x-medx) = ');
c = arrayfun(@fmt, gamma, 'UniformOutput', false);
fprintf('%s ', c{:});
fprintf('\n');

fprintf('Sum(x-medx) = %s\n', fmt(sum (gamma)));

fprintf('(xi^2) = ');
c = arrayfun(@fmt, delta, 'UniformOutput', false);
fprintf('%s ', c{:});
fprintf('\n');

fprintf('Sum(xi^2) = %s\n', fmt(sum (delta)));

fprintf('(x-medx)yi = ');
c = arrayfun(@fmt, epsilon, 'UniformOutput', false);
fprintf('%s ', c{:});
fprintf('\n');

fprintf('Sum(x-medx)yi = %s\n', fmt(sum (epsilon)));

fprintf('(x-medx)^2 = ');
c = arrayfun(@fmt, zeta, 'UniformOutput', false);
fprintf('%s ', c{:});
fprintf('\n');

fprintf('Sum(x-medx)^2 = %s\n', fmt(sum (zeta)));

fprintf('(yci) = ');
c = arrayfun(@fmt, eta, 'UniformOutput', false);
fprintf('%s ', c{:});
fprintf('\n');

fprintf('Sum(yci) = %s\n', fmt(sum (eta)));

fprintf('(yci-yi)^2 = ');
c = arrayfun(@fmt, theta, 'UniformOutput', false);
fprintf('%s ', c{:});
fprintf('\n');

fprintf('Sum(yci-yi)^2 = %s\n', fmt(sum (theta)));

end