% 2.1. Random walk
disp("== 2.1. Random walk ==");

N = 1000; % number of simulations

% Random walk Y(n) sum of 𝑛 iid rv's Xᵢ, with Xᵢ ~ Ber{-1, 1}
% taking the value 1 with probability 𝑝 and -1 with probability 1-𝑝
% Y(n) = X₁ + X₂ + ... + Xₙ = ∑[i=1, n] Xᵢ


%%

disp("a) Analytically find mean and variance of Y(n). Are they constant when p=1/4?");
% E[X]  = ∑[xᵢ ∈ {-1, 1}] xᵢ * P(X = xᵢ) = -1 * (1-p) + 1 * p = p -1 + p = 2p - 1
% E[X²] = ∑[xᵢ ∈ {-1, 1}] xᵢ² * P(X = xᵢ) = 1 * (1-p) + 1 * p = 1 - p + p = 1

% E[Y]  = E[∑[i=1, n] Xᵢ] = ∑[i=1, n] E[Xᵢ] = ∑[i=1, n] (2p - 1) = n*(2p - 1)
% Var[Y] = E[Y²] - E[Y]² = E[(∑[i=1, n] Xᵢ)²] - (n*(2p - 1))² =
%  = E[ ∑[i=1, n] Xᵢ² + ∑[i=1, n]∑[j≠i, n] Xᵢ*Xⱼ ] - (n*(2p-1))² =
%  = ∑[i=1, n] (E[Xᵢ²]) + ∑[i=1, n]∑[j=1, n] (E[Xᵢ*Xⱼ]) - ∑[i=1, n]∑[j=i,i] (E[Xᵢ*Xⱼ]) - (n*(2p-1))² =
%  = ∑[i=1, n] (1) + ∑[i=1, n]∑[j=1, n] (E[Xᵢ]*E[Xⱼ]) - ∑[i=1, n] (E[Xᵢ]*E[Xᵢ]) - (n*(2p-1))² =
%  = n + n²*(2p-1)² - n*(2p-1)² - (n*(2p-1))² = n - n*(2p-1)² = n*(1-(2p-1)²)
% When p = 1/4,
%  E[Y] = n*(2/4 - 1) = n*(-1/2) = -n/2
%  Var[Y] = n*(1-(2/4-1)²) = n*(1-(-1/2)²) = n*(1-1/4) = 3n/4
% So E[Y] and Var[Y] are not constant when p = 1/4

% Now, let's simulate the random walks
p = linspace(0, 1, 11); % probability of taking the value 1
n = 1:13:260; % number of steps
Y = zeros([numel(n) numel(p) N]);
for i = 1:numel(p) % Iterating through different values of p and n
    for j = 1:numel(n)
        % Simulate N random walks of n(j) steps with probability p(i)
        % by calculating the sum of n(j) iid rv's Xᵢ, with Xᵢ ~ Ber{-1, 1}
        % taking the value 1 with probability 𝑝 and -1 with probability 1-𝑝
        % For each combination, we simulate N random walks
        Y(j,i,:) = sum( 2*(rand(N, n(j)) < p(i)) - 1 , 2);
    end
end

% And plot the results side by side with the theoretical values
[pp, nn] = meshgrid(p, n);

% Expected value
figure(1);
tiledlayout(1, 2);

nexttile;
surf(pp, nn, mean(Y,3));
title("Simulated mean of Y");
xlabel("p"); ylabel("n"); zlabel("Mean(Y)");

nexttile; % E[Y] = n*(2p-1)
E = arrayfun(@(n, p) n*(2*p-1), nn, pp, UniformOutput=true);
surf(pp, nn, E);
title("Theoretical mean of Y");
xlabel("p"); ylabel("n"); zlabel("E[Y]");

% Variance
figure(2);
tiledlayout(1, 2);

nexttile;
surf(pp, nn, var(Y,1,3));
title("Simulated variance of Y");
xlabel("p"); ylabel("n"); zlabel("Var(Y)");

nexttile; % Var[Y] = n*(1-(2p-1)²)
V = arrayfun(@(n, p) n*(1-(2*p-1)^2), nn, pp, UniformOutput=true);
surf(pp, nn, V);
title("Theoretical variance of Y");
xlabel("p"); ylabel("n"); zlabel("Var(Y)");


disp(" ");


%%

disp('b) Overlapping plots of three realizations "of a Bernoulli process" with p=1/4 and n=1000');
% The instructions are not clear, so I'm going to plot three random walks, not three Bernoulli processes.
% The random walks are simulated as in a), but with n = 1000 and p = 1/4
n = 1000; p = 1/4;
y = cumsum( 2*(rand(3, 1000) < p) - 1 , 2);

figure(3);
plot(1:n, y(1,:), 1:n, y(2,:), 1:n, y(3,:));

% The graph shows that the lines do indeed end up at around -500, which is the expected value of Y
