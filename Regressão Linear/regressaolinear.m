function [a, b, delta_y, delta_a, delta_b, alpha, beta, gamma, delta, epsilon, zeta, eta, theta] = regressaolinear(x, y)

x = x(:);
y = y(:);

N = length(x);

medx = mean(x);
medy = mean(y);

anum = sum((x - medx).*y);
aden = sum((x - medx).^2);

a = anum / aden;

b = medy - a*medx;

yci = a*x + b;

min = sum((yci - y).^2);

delta_y = sqrt( min / (N - 2) );

delta_a = delta_y / sqrt( aden );

delta_b = sqrt ( sum(x.^2) / (N*aden) )*delta_y;


alpha = x;
beta = y;
gamma = x-medx;
delta = x.^2;
epsilon = gamma.*y;
zeta = gamma.^2;
eta = yci;
theta = (yci - y).^2;

end