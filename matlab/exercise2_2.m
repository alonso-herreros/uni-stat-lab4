% 2.2. Harmonic processes
disp("== 2.2. Harmonic processes ==");

N = 10000; % number of simulations

%%

disp("Plot 3 realizations of Z(t) for t = 0:0.01:2π");

% X and Y independent normal rv's with μ_X = μ_Y = 0 and σ²_X = σ²_Y = 1.
% Z = X*cos(2πt) + Y*sin(2πt)
% Three realizations of Z with t = 0:0.01:2π

t = 0:0.01:2*pi;
X = normrnd(0,1,3,length(t));
Y = normrnd(0,1,3,length(t));
Z = Y.*cos(2*pi*t) + Y.*sin(2*pi*t);

figure(1);
plot(t,Z(1,:), t,Z(2,:), t,Z(3,:));

disp(" ");


