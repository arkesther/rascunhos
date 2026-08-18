function regprint(x, y)

[a, b, delta_y, delta_a, delta_b] = regressaolinear(x, y);


function s = fmt(x)
    if abs(x) < 1e-4 || abs(x) >= 1e4
        s = sprintf('%.4g', x);
    else
        s = sprintf('%.4f', x);
    end
end


fprintf('a = %s\n', fmt(a));
fprintf('b = %s\n', fmt(b));
fprintf('delta_y = %s\n', fmt(delta_y));
fprintf('delta_a = %s\n', fmt(delta_a));
fprintf('delta_b = %s\n', fmt(delta_b));

end