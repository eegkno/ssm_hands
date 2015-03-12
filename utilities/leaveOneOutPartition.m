% Generate indices to partition data
%
% input
%	- lambda_k2 	Eigenvalues
%	- modes 		Number of modes to be taken
%
% output
%
%	By 				Edgar Garcia Cano
%	Created 		Feb 4, 2015

function [indices, subData, sampleOut] = leaveOneOutPartition( idx, data)

	s = size(data,1);
	indices = [1:s]';
	aux = find(indices ~= idx);
	indices = aux;
	subData = data(indices,:);
	sampleOut = data(idx,:);
end