% 2.2. Harmonic processes
disp("== 2.2. Harmonic processes ==");

%%

disp("Plot 3 realizations of Z(t) for t = 0:0.01:2π");

% X and Y independent normal rv's with μ_X = μ_Y = 0 and σ²_X = σ²_Y = 1.
% Z = X*cos(2πt) + Y*sin(2πt)
% Three realizations of Z with t = 0:0.01:2π

t = 0:0.01:2*pi;
X = normrnd(0,1,3,1);
Y = normrnd(0,1,3,1);
Z = X*cos(2*pi*t) + Y*sin(2*pi*t);

figure(1);
plot(t,Z(1,:), t,Z(2,:), t,Z(3,:));
% Describe the parameters of each realization in the top right corner
legend(...
    "Z_1: X=" + num2str(X(1), 2) + ", Y=" + num2str(Y(1), 2), ...
    "Z_2: X=" + num2str(X(2), 2) + ", Y=" + num2str(Y(2), 2), ...
    "Z_3: X=" + num2str(X(3), 2) + ", Y=" + num2str(Y(3), 2));

disp(" ");


