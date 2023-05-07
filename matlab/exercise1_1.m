%% 1.1. Random Vectors: Exercise 1
disp('== 1.1. Random Vectors: Exercise 1 ==');

N = 100000; % number of simulations

% x is a random variable with uniform distribution in (0, T)
% X ~ U(0, T)
% z is a random variable with uniform distribution in (x, T)
% Z ~ U(X, T)
% y is the distance from x to z => y = z - x
% Y ~ U(0, T-x)

disp("a) Find the joint density of (X, Y)"); 
% f(x, y) = f(x ∪ y) = f(y | x) * f(x) 
% First, fX(x) = 1/T
% Now, instead of finding fY(y), we only need fY(y | x), which is the probability of y given x. It's uniform in (0, T-x)
% f(x, y) = 1/(T-x) * 1/T = 1/(T*(T-x))

% I will simulate the experiment to check if the result is correct using three values of T: 0.5, 1, 5
for T = [0.5, 1, 5]
    x = unifrnd(0, T, N, 1);
    z = arrayfun(@(x) unifrnd(x, T), x);
    y = arrayfun(@(x, z) z-x, x, z);
    % I could generate y directly, but I want to use the described procedure

    figure;
    tiledlayout(1, 2);
    set(gcf, Units='Normalized', OuterPosition=[0.25 0.25 0.75 0.75])
    % using tiledlayout to plot both simulated and theoretical results in the same window

    % plot the joint probability density function acquired by simulation
    nexttile;
    histogram2(x, y, Normalization='pdf', NumBins=50);
    title("Simulated joint PDF for T = " + T);
    xlabel("x"); ylabel("y"); zlabel("f(x, y)");

    % plot the theoretical joint probability density function
    % using the formula f(x, y) = 1/(T*(T-x))
    nexttile;
    [X, Y] = meshgrid(0:T/50:T, 0:T/50:T);
    Z = (Y+X<T) .* 1./(T*(T-X));
    surf(X, Y, Z);
    title("Theoretical joint PDF for T = " + T);
    xlabel("x"); ylabel("y"); zlabel("f(x, y)");

    % Numerically compare the theoretical and simulated results
    disp("T = " + T);
    disp(" Theoretical mean of X: " + T/2);
    disp(" Simulated   mean of X: " + mean(x));
    disp(" Theoretical mean of Y: " + T/3);
    disp(" Simulated   mean of Y: " + mean(y));
    disp(" Theoretical variance of X: " + T^2/12);
    disp(" Simulated   variance of X: " + var(x));
    disp(" Theoretical variance of Y: " + T^2/18);
    disp(" Simulated   variance of Y: " + var(y));

end


disp(" ");



disp("b) Simulate P(Y - X < 0) for T = 5"); 
T = 5;
x = unifrnd(0, T, N, 1);
y = arrayfun(@(x) unifrnd(0, T-x), x);
disp("Simulated one case at a time.")
disp("P(Y - X < 0) = " + sum(y-x < 0)/N);
disp(" ");


