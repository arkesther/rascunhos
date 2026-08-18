function [a_orig, b_orig, a_log, b_log] = pontos(x, y)
    x = x(:); y = y(:);
    N = length(x);

    a_orig = []; b_orig = [];
    a_log = []; b_log = [];

    for i = 1:N-1
        for j = i+1:N

            dx = x(j) - x(i);
            
            if dx ~= 0
                a_orig = [a_orig; (y(j) - y(i)) / dx];
                b_orig = [b_orig; y(i) - (a_orig(end) * x(i))];
            end

            if x(i)>0 && x(j)>0 && y(i)>0 && y(j)>0
                lx1 = log10(x(i)); lx2 = log10(x(j));
                ly1 = log10(y(i)); ly2 = log10(y(j));
                dlx = lx2 - lx1;
                if dlx ~= 0
                    angL = (ly2 - ly1) / dlx;
                    a_log = [a_log; angL];
                    b_log = [b_log; ly1 - angL * lx1];
                end
            end
        end
    end

    for k = 1:length(a_orig)
        fprintf('--- Par %d ---\n', k);
        fprintf('Original: a = %.4f, b = %.4f\n', a_orig(k), b_orig(k));
        
        if k <= length(a_log)
            fprintf('Log-Log:  a = %.4f, b = %.4f\n', a_log(k), b_log(k));
        end
        fprintf('----------------\n');
    end

end