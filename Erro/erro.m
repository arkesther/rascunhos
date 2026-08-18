classdef erro

    properties
        valor
        inc
    end

    methods

        function obj = erro(valor, inc)

            if nargin > 0
                obj.valor = valor;
                obj.inc = abs(inc);
            end

        end

        function r = plus(a,b)

            if isnumeric(a)
                a = erro(a,0);
            end

            if isnumeric(b)
                b = erro(b,0);
            end

            r = erro( ...
                a.valor + b.valor, ...
                a.inc + b.inc );

        end

        function r = minus(a,b)

            if isnumeric(a)
                a = erro(a,0);
            end

            if isnumeric(b)
                b = erro(b,0);
            end

            r = erro( ...
                a.valor - b.valor, ...
                a.inc + b.inc );

        end

        function r = mtimes(a,b)

            if isnumeric(a)
                a = erro(a,0);
            end

            if isnumeric(b)
                b = erro(b,0);
            end

            r = erro( ...
                a.valor*b.valor, ...
                abs(a.valor)*b.inc + abs(b.valor)*a.inc );

        end

        function r = mrdivide(a,b)

            if isnumeric(a)
                a = erro(a,0);
            end

            if isnumeric(b)
                b = erro(b,0);
            end

            r = erro( ...
                a.valor/b.valor, ...
                (abs(a.valor)*b.inc + abs(b.valor)*a.inc)/(b.valor^2) );

        end

        function r = mpower(a,n)

            if isnumeric(a)
                a = erro(a,0);
            end

            r = erro( ...
                a.valor^n, ...
                abs(n*(a.valor^(n-1)))*a.inc );

        end

        function display(obj)

            nome = inputname(1);

            if isempty(nome)
                nome = 'ans';
            end

            fprintf('%s = %.10f ± %.10f\n', ...
                nome, obj.valor, obj.inc);

        end

        function v = double(obj)

            v = obj.valor;

        end

    end

end