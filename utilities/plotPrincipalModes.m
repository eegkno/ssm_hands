% Print principal modes of variation
%
% input
%	- meanShapa	Mean shape
%	- Psi_k			Eigenvectors
%	- lambda_k		Eigenvalues
%	- s 				Standard deviation
%	- fig 			Number of the figure to be plotted
%
% output
%
%	By 				Edgar Garcia Cano
%	Created 		Jan 12, 2015



function plotPrincipalModes( meanShape, Psi_k, lambda_k, s, fig)

	%Copy the mean shaoe to a matrix
	U = repmat(meanShape,40,1);  

	figure(fig); % create new figure
	annotation('textbox', [0 0.9 1 0.1], ...
	    'String', 'Distribution of the principal modes', ...
	    'EdgeColor', 'none', ...
	    'HorizontalAlignment', 'center')

	sample = 1;

	for m = 1:4
		A1 = s.*sqrt( lambda_k(m)).*Psi_k(:,m)';
		A2 = -s.*sqrt( lambda_k(m)).*Psi_k(:,m)';

		B1 = repmat(A1,40,1);
		B2 = repmat(A2,40,1);

		Z1 = U + B1;
		Z2 = U + B2;

		subplot(4,2, (m*2)-1) 
		X = reshape(Z1(sample,:), [56 2]);
		plot(X(:,1), X(:,2));
		title(  sprintf( 'sigma * sqrt(lambda(%d))',m)  );
		
		subplot(4,2,(m*2)) 
		X = reshape(Z2(sample,:), [56 2]);
		plot(X(:,1),X(:,2));
		title( sprintf( '- sigma * sqrt(lambda(%d))',m) );

	end

end