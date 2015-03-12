% Finds the PCA distributionmatrix and eigenvectors vector
%
% input
%	- Phi_k			The shapes to do PCA
%	- V			The mean shape of the passed shapes
%
% output
%	- Psi_k			The eigenvectors vector of the covariance shape matrix
%	- lambda_k		The eigenvalues vector of the covariance shape matrix
%
%	By 			Edgar Garcia Cano
%	Created 		Oct 8, 2014
% Reference
%                 http://www.nlpca.org/pca-principal-component-analysis-matlab.html
%                 http://stackoverflow.com/questions/17324156/using-pca-algorithm-for-adjusting-data


function [Psi_k, lambda_k] = principalComponentAnalysis(Phi_k, V)

X = Phi_k;	   
T = V;       
U = repmat(T, size(Phi_k,1),1);      


data = X-U;
covS = cov(data);
%size(covS)
%figure, imagesc(covS); colormap(gray);

[U, S, V] = svd(covS);	%U = eigenvectors, S = eigenvalues
Psi_k = U;
lambda_k = diag(S);
%size(lambda_k)

%principal components space of  k elements
%k = 5;
%Psi = Psi_k(:,1:k);  

%data projected onto eigenspace
%b_k = data*Psi;


%Approximation
%S = U + b_k2*Psi2';

%show the approximation
%showShapes(S(40,:), 20);
%title('Approximation');


%% ==========
% This section was used to calculate  the eigenvalues and eigenvectors
% using the function eig(). Using this function it was necesary to sort the
% eigenvalues and eigenvectors.
%% ==========

% %get eigenvectors (Psi_k) and eigenvalues (evalues)
% [Psi_k, evalues] = eig(covS);

% % order by largest eigenvalues
% lambda_k = diag(evalues);
% lambda_k = lambda_k(end:-1:1);
% Psi_k = Psi_k(:,end:-1:1); 

% %principal components space of  k elements
% k = 5;
% Psi = Psi_k(:,1:k);  

% %data projected onto eigenspace
% b_k = data*Psi;

% %Approximation
% S = U + b_k*Psi';

% %show the sample
% showShapes(Phi_k(40,:), fig1);
% title('Original');

% %show the approximation
% showShapes(S(40,:), fig2 );
% title('Approximation');

%===========



