% Shows the passed set of shapes in the  figure
%
% input
%	- lambda_k2 	Eigenvalues
%	- modes 		Number of modes to be taken
%
% output
%
%	By 				Edgar Garcia Cano
%	Created 		Jan 14, 2015

function  [porcentage] = compactness(lambda_k2, modes )

	porcentage = sum(lambda_k2(1:modes)) / sum(lambda_k2);

end