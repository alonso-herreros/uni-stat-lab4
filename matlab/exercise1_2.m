% 1.2. Random Vectors: Exercise 2
disp("== 1.2. Random Vectors: Exercise 2 ==");

N = 100000; % number of simulations

% Independent X (continuous) and Y (discrete)
% X ~ U(-1, 1) = 1 + U(0, 2)  => fX(x) = 1/2
% Y ~ (  0     1 )  => { P(Y = 0) = 0.25  =>  fY(y) = { 0.25  if y = 0
%     (0.25  0.75)     { P(Y = 1) = 0.75              { 0.75  if y = 1
% Now R = X + Y  =>  r ∈ [-1, 2]


%%

disp("a) Find fR(r)");
% Let's look at the three different cases
% For r ∈ [-1, 0):
%  x+y ∈ [-1, 0)  =>  y = 0, x ∈ [-1, 0)
%  fR(r) = fY(0) * fX(z) = 1/4 * 1/2 = 1/8
% For r ∈ [0, 1]:
%  x+y ∈ [0, 1]  =>  { y = 0, x ∈ [0, 1] } ∪ { y = 1, x ∈ [-1, 0] }
%  fR(r) = fY(0) * fX(z) + fY(1) * fX(z-1) = 1/4 * 1/2 + 3/4 * 1/2 = 1/2
% For r ∈ (1, 2]:
%  x+y ∈ (1, 2]  =>  y = 1, x ∈ (0, 1]
%  fR(r) = fY(1) * fX(z-1) = 3/4 * 1/2 = 3/8

%         { 1/8  if -1 ≤ r < 0
% fR(r) = { 1/2  if  0 ≤ r ≤ 1
%         { 3/8  if  1 < r ≤ 2
%         {  0   otherwise

figure(1);
expression = "$ f_R(r) = \left\{ \begin{array}{ll} \frac{1}{8} & \mbox{if } -1 \leq r < 0 \\ \frac{1}{2} & \mbox{if } 0 \leq r \leq 1 \\ \frac{3}{8} & \mbox{if } 1 < r \leq 2 \\ 0 & \mbox{otherwise} \end{array} \right. $";
text(0, 1, expression, Interpreter="latex", FontSize=14, Units="normalized", HorizontalAlignment="left", VerticalAlignment="top")


% I will do a simulation to check the results
x = unifrnd(-1, 1, N, 1);
y = arrayfun(@(u) 0 + (u > 0.25), rand(N, 1));
r = x + y;
% Let's plot the histogram
figure(2);
histogram(r, 20, Normalization="pdf");
title("Simulated histogram of R");
xlabel("r");
ylabel("fR(r)");
% Let's plot the theoretical pdf
figure(3);
x = linspace(-1, 2, 1000);
y = arrayfun(@(x) (1/8)*(x >= -1 && x < 0) + (1/2)*(x >= 0 && x <= 1) + (3/8)*(x > 1 && x <= 2), x);
plot(x, y, "r");
title("Theoretical PDF of R");

disp(" ");

%%

disp("b) Calculate theoretically E[R] and Var[R]");
% E[R] = ∫[-∞, +∞] r*fR(r) dr = ∫[-1, 0) r*fR(r) dr + ∫[0, 1] r*fR(r) dr + ∫(1, 2] r*fR(r) dr =
%      = ∫[-1, 0) r*(1/8) dr + ∫[0, 1] r*(1/2) dr + ∫(1, 2] r*(3/8) dr =
%      = (r²/16)*|[-1, 0) + (r²/4)*|[0, 1] + (3r²/16)*|(1, 2] =
%      = (1/16)*(0-1) + (1/4)*(1-0) + (3/16)*(4-1) = 
%      = -1/16 + 1/4 + 9/16 = 3/4 = 0.75
disp("Theoretical E[R] = 0.75");
disp("Simulated   E[R] = " + mean(r) + " (should be close to 0.75)")

% Var[R] = E[R²] - E[R]² = ∫[-∞, +∞] r²*fR(r) dr - (3/4)² =
%        = ∫[-1, 0) r²*(1/8)dr + ∫[0, 1] r²*(1/2)dr + ∫(1, 2] r²*(3/8)dr - (9/16) =
%        = (r³/24)*|[-1, 0) + (r³/6)*|[0, 1] + (3r³/24)*|(1, 2] - (9/16) =
%        = (1/24)*(0-(-1)) + (1/6)*(1-0) + (3/24)*(8-1) - (9/16) =
%        = 1/24 + 1/6 + 21/24 - 9/16 = 1/24 + 4/24 + 21/24 - 9/16 = 25/48 = 0.5208333333333333
disp("Theoretical Var[R] = 25/48 = 0.52083");
disp("Simulated   Var[R] = " + var(r) + " (should be close to 0.52083)")

disp(" ");


%%

disp("c) Simulate the previous results")
% Oh, I had already done that. Nice.

