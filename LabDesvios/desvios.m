function [medx, desvmedx, desvpadx, medy, desvmedy, desvpady] = desvios(x, y)

x = x(:);
y = y(:);

N = length(x);

medx = mean(x);
medy = mean(y);

desvmedx = sum(abs(x-medx))/N;
desvmedy = sum(abs(y-medy))/N;

desvpadx = sqrt(sum((x-medx).^2)/(N-1));
desvpady = sqrt(sum((y-medy).^2)/(N-1));

    function s = fmt(x)
        if abs(x) < 1e-4 || abs(x) >= 1e4
            s = sprintf('%.4g', x);
        else
            s = sprintf('%.4f', x);
        end
    end

fprintf('media x = %s\n', fmt(medx));
fprintf('desvio medio x = %s\n', fmt(desvmedx));
fprintf('desvio padrão x = %s\n', fmt(desvpadx));
fprintf('----------------\n');
fprintf('media y = %s\n', fmt(medy));
fprintf('desvio medio y = %s\n', fmt(desvmedy));
fprintf('desviopadrão y = %s\n', fmt(desvpady));

end