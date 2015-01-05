% Finds the PCA distributionmatrix and eigenvectors vector
%
% input
%	- V_k			     The shapes to do PCA
%	- V			The mean shape of the passed shapes
%
% output
%	- Psi_k			   The eigenvectors vector of the covariance shape matrix
%	- lambda_k		 The eigenvalues vector of the covariance shape matrix
%
%	By 				     Edgar Garcia Cano
%	Created 		   Oct 8, 2014
% Reference
%                 http://www.nlpca.org/pca-principal-component-analysis-matlab.html
%                 http://stackoverflow.com/questions/17324156/using-pca-algorithm-for-adjusting-data


function [Psi_k, lambda_k] = principalComponentAnalysis2(Phi_k, V)

X = Phi_k;	   %40 x 112
T = V;       
U = repmat(T,40,1);      %40 x 112 copy of the mean shape


data = X-U;
covS = cov(data);
%size(covS)
%figure, imagesc(covS); colormap(gray);

%get eigenvectors (Psi_k) and eigenvalues (evalues)
[Psi_k, evalues] = eig(covS);

% order by largest eigenvalues
lambda_k = diag(evalues);
lambda_k = lambda_k(end:-1:1);
Psi_k = Psi_k(:,end:-1:1); 

%principal components space of  k elements
k = 5;
Psi = Psi_k(:,1:k);  

% size(data);	%40 x 112
% size(Psi);	%112 x 5

%data projected onto eigenspace
b_k = data*Psi;		
% size(b_k); 	%40 x 5	
% size(Psi_k);	%112 x 112


%Approximation
S = U + b_k*Psi';
size(S);
%b_k;

%Obtain the sample
%show sample using the approximation
showShapes2(S(40,:), 20, []);
title('Approximation');

showShapes2(Phi_k(40,:), 21,[]);
title('Original');
