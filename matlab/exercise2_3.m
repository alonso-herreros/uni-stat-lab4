% 2.3. Harmonic processes with white noise
disp("== 2.3. Harmonic process with white noise ==");

N = 10000; % number of simulations

% Y(t) = a*sin(ωt+u) + W(t)
% a = 1,
% ω = π/5
% u ~ U(-π, π)
% W(t) ~ N(0, 1)


%%

disp("a) Determine analitically the mean of Y(t). Is it constant?");

% E[Y(t)] = E[a*sin(ωt+u) + W(t)] = a*E[sin(ωt+u)] + E[W(t)] = 0 + 0 = 0
disp("Analitical mean: 0");

disp(" ");

disp("a) Plot three realizations with t=[1..150]. Is it consistent with the theoretical result?");

t = 1:150;

Y = 1*sin(pi/5*t + unifrnd(-pi, pi, 3, 150)) + normrnd(0, 1, 3, 150);

plot(t, Y(1,:), t, Y(2,:), t, Y(3,:));

disp("Mean of each simulation: " + mean(Y(1,:)) +", "+ mean(Y(2,:)) +", "+  mean(Y(3,:)));

% The plot shows that the values do indeed oscillate around 0.


