% Shows the  eigenvalues in the  figure
%
% input
%	- lambda_k 		Eigenvalues
%	- fig 			Number of the figure to be plotted
%
% output
%
%	By 				Edgar Garcia Cano
%	Created 		Jan 14, 2015

function plotEigenvalues(lambda_k, fig)

	figure1 = figure(fig);
	axes1 = axes('Parent',figure1,'XTick',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]);
	box(axes1,'on');
	 grid(axes1,'on');
	hold(axes1,'all');
	plot( lambda_k );
	title('Distribution of eigenvalues');
	xlabel('Eigenvlues');
	ylabel('Magnitud of eigenvalues');

end
