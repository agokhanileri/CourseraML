function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% You need to set these values correctly
X_norm = X;

% ====================== YOUR CODE HERE ======================
[m, n]  = size(X);
for i = 1:n        
    mu(i) = mean(X(:,i));
    sigma(i) = std(X(:,i));
    X_norm(:, i)  = (X(:, i) - mu(i))/sigma(i);
end
% ============================================================

end
