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


function [Psi_k, lambda_k] = principalComponentAnalysis(Phi_k, V)

%===== FALTA AUTOMATIZAR LOS INDICES

 W = zeros([112 40]);
 for i=1:size(Phi_k,3)
    W(:,i) =reshape(Phi_k(:,:,i)', [112 1]);
 end

X = W';	   %40 x 112
T = V';       
T = reshape(T, [1, 112]);    %1 x 112
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

%principal components space de  k elements
k = 5;
Psi = Psi_k(:,1:k);  

size(data);	%40 x 112
size(Psi);	%112 x 5

%data projected onto eigenspace
b_k = data*Psi;		
size(b_k); 	%40 x 5	
size(Psi_k);	%112 x 112


%Approximation
S = U + b_k*Psi';
%size(S);
%b_k;

%Obtain the sample
S1 = reshape(S(40,:), [56 2] );
%show sample using the approximation
showShapes(S1', 20, []);
title('Approximation');

showShapes(Phi_k(:,:,40), 21,[]);
title('Original');

% b1 = ones([40  5]) .*(-3)*sqrt(lambda_k(1))

% SS = U + b1*Psi';
% SS1 = reshape(SS(1,:), [56 2] )
% showShapes(SS1', 20, []);

%======
% consider an artificial data set of 100 variables (e.g., genes) and 10 samples
%    data=rand(100,10);

% remove the mean variable-wise (row-wise)
%    data=data-repmat(mean(data,2),1,size(data,2));

% calculate eigenvectors (loadings) W, and eigenvalues of the covariance matrix
%    [W, EvalueMatrix] = eig(cov(data'));
%    Evalues = diag(EvalueMatrix);

% order by largest eigenvalue
%    Evalues = Evalues(end:-1:1);
%    W = W(:,end:-1:1); W=W';

% generate PCA component space (PCA scores)
%    pc = W * data;

% plot PCA space of the first two PCs: PC1 and PC2
%    plot(pc(1,:),pc(2,:),'.')
