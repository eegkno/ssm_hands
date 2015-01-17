% Shows the passed set of shapes in the  figure
%
% input
%	- T_k 			Figure or set of figures
%	- fig 			Number of the figure to be plotted
%
% output
%
%	By 				Edgar Garcia Cano
%	Created 		Jan 12, 2015

function showShapes(T_k, fig )

	[nshapes, npoints ] = size(T_k);

	colors = 'bgrcmyk';
	figure(fig); colormap(gray); set(gcf,'DoubleBuffer','On'); clf; 
	for i=1:nshapes
	   hold on;
	   X = reshape(T_k(i,:), [56 2]); 
	   hold on;
	   plot(X(:,1), X(:,2), sprintf('%c-*',colors(mod(i,length(colors))+1)));
	   hold off;
	end

return;
 