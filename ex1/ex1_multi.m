%% Machine Learning Online Class
%  Exercise 1: Linear regression with multiple variables


%% Initialization

%% ================ Part 1: Feature Normalization ================

%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');

%% Load Data
data = load('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Print out some data points
fprintf('First 10 examples from the dataset: \n');
fprintf(' x = [%.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');

fprintf('Program paused. Press enter to continue.\n');
%pause;

% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

[X mu sigma] = featureNormalize(X);

% Add intercept term to X
X = [ones(m, 1) X];


%% ================ Part 2: Gradient Descent ================

% ====================== YOUR CODE HERE ======================
%               After that, try running gradient descent with 
%               different values of alpha and see which one gives
%               you the best result.
%
%               Finally, you should complete the code at the end
%               to predict the price of a 1650 sq-ft, 3 br house.
%
% Hint: By using the 'hold on' command, you can plot multiple
%       graphs on the same figure.
%
% Hint: At prediction, make sure you do the same feature normalization.
%

fprintf('Running gradient descent ...\n');
% Choose some alpha value
num_iters = 400;


figure;
alphas =  [0.01, 0.03, 0.10];
for alpha = alphas
    % Init Theta and Run Gradient Descent 
    theta = zeros(3, 1);
    [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);
    theta

    % Plot the convergence graph
    
    plot(1:numel(J_history), J_history, 'LineWidth', 2);
    xlabel('Number of iterations');
    ylabel('Cost J');
    hold on; grid on; 

    % Display gradient descent's result
    fprintf('Theta computed from gradient descent: \n');
    fprintf(' %f \n', theta);
    fprintf('\n');
end
leg = legend(num2str(alphas(1)), num2str(alphas(1)), num2str(alphas(1)))
leg.Title.Visible = 'on';
[leg,att]  = legend('show');
title(leg, 'alpha:')
leg.Title.NodeChildren.Position = [0.5 1.5 0];

% Estimate the price of a 1650 sq-ft, 3 br house
% ====================== YOUR CODE HERE ======================
% Recall that the first column of X is all-ones. Thus, it does
% not need to be normalized.

price = [1, ([1650, 3] - mu)./sigma]*theta; % You should change this
% ============================================================

fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using gradient descent):\n $%3.0f\n'], price);
fprintf('Program paused. Press enter to continue.\n');
pause;


%% ================ Part 3: Normal Equations ================
fprintf('Solving with normal equations...\n');

% ====================== YOUR CODE HERE ======================
% Instructions: The following code computes the closed form 
%               solution for linear regression using the normal
%               equations. You should complete the code in 
%               normalEqn.m
%
%               After doing so, you should complete this code 
%               to predict the price of a 1650 sq-ft, 3 br house.
%

%% Load Data
data = csvread('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Add intercept term to X
X = [ones(m, 1) X];

% Calculate the parameters from the normal equation
theta = normalEqn(X, y);

% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);
fprintf('\n');


% Estimate the price of a 1650 sq-ft, 3 br house
% ====================== YOUR CODE HERE ======================
price = 0; % You should change this


% ============================================================

fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using normal equations):\n $%f\n'], price);

