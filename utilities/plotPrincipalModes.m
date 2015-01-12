% Print principal modes of variation
%
% input
%	- meanShapa	Mean shape
%	- Psi_k			Eigenvectors
%	- lambda_k		Eigenvalues
%	- s 				Standard deviation
%
% output
%
%	By 				Edgar Garcia Cano
%	Created 		Jan 12, 2015
% Reference


function plotPrincipalModes( meanShape, Psi_k, lambda_k, s)

%Copy the mean shaoe to a matrix
U = repmat(meanShape,40,1);  


m = 1;
A11 = s.*sqrt( lambda_k(m)).*Psi_k(:,m)';
A12 = -s.*sqrt( lambda_k(m)).*Psi_k(:,m)';

m = 2;
A21 = s.*sqrt( lambda_k(m)).*Psi_k(:,m)';
A22 = -s.*sqrt( lambda_k(m)).*Psi_k(:,m)';

m = 3;
A31 = s.*sqrt( lambda_k(m)).*Psi_k(:,m)';
A32 = -s.*sqrt( lambda_k(m)).*Psi_k(:,m)';

m = 4;
A41 = s.*sqrt( lambda_k(m)).*Psi_k(:,m)';
A42 = -s.*sqrt( lambda_k(m)).*Psi_k(:,m)';

%
B11 = repmat(A11,40,1);
B12 = repmat(A12,40,1);

B21 = repmat(A21,40,1);
B22 = repmat(A22,40,1);

B31 = repmat(A31,40,1);
B32 = repmat(A32,40,1);

B41 = repmat(A41,40,1);
B42 = repmat(A42,40,1);

%
Z11 = U + B11;
Z12 = U + B12;

Z21 = U + B21;
Z22 = U + B22;

Z31 = U + B31;
Z32 = U + B32;

Z41 = U + B41;
Z42 = U + B42;

sample = 1;

figure % create new figure
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'Distribution of the principal modes', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')

subplot(4,2,1) 
X = reshape(Z11(sample,:), [56 2]);
xpts = X(:,1);
ypts = X(:,2);
plot(xpts,ypts);
title('sigma * sqrt(lambda(1))');

subplot(4,2,2) 
X = reshape(Z12(sample,:), [56 2]);
xpts = X(:,1);
ypts = X(:,2);
plot(xpts,ypts);
title('-sigma * sqrt(lambda(1))');

subplot(4,2,3) 
X = reshape(Z21(sample,:), [56 2]);
xpts = X(:,1);
ypts = X(:,2);
plot(xpts,ypts);
title('sigma * sqrt(lambda(2))');

subplot(4,2,4) 
X = reshape(Z22(sample,:), [56 2]);
xpts = X(:,1);
ypts = X(:,2);
plot(xpts,ypts);
title('-sigma * sqrt(lambda(2))');

subplot(4,2,5) 
X = reshape(Z31(sample,:), [56 2]);
xpts = X(:,1);
ypts = X(:,2);
plot(xpts,ypts);
title('sigma * sqrt(lambda(3))');

subplot(4,2,6) 
X = reshape(Z32(sample,:), [56 2]);
xpts = X(:,1);
ypts = X(:,2);
plot(xpts,ypts);
title('-sigma * sqrt(lambda(3))');

subplot(4,2,7) 
X = reshape(Z41(sample,:), [56 2]);
xpts = X(:,1);
ypts = X(:,2);
plot(xpts,ypts);
title('sigma * sqrt(lambda(4))');

subplot(4,2,8) 
X = reshape(Z42(sample,:), [56 2]);
xpts = X(:,1);
ypts = X(:,2);
plot(xpts,ypts);
title('-sigma * sqrt(lambda(4))');



end