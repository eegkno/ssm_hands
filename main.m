%	This file is used to run them all
%
%
%	By 				Edgar Garcia Cano
%	Created 		October 24, 2014
%	Modifications


%% Initialization
clear all ; close all; clc


% Names of the variables

% T_k 		dataset
% Phi_k		transformations
% Z_iter	set of mean shapes obtained from the training process
% Z 		final mean shape
% Phi_k 	transformation after the Procrustes analisys
% V 		average of the Phi_k
% Psi_k		eigenvectors vector of the covariance shape matrix
% lambda_k	eigenvalues vector of the covariance shape matrix

%=========  PART 1: LOADING DATA ==========
 fprintf('\n Loading datset....');
%%Generate dataset
[T_k, Phi_k] = initializeDataSetHands();
showShapes(T_k, 1, []);
title('Initial dataset');

%== use with initializeDataSetHands2() ==
%X = reshape(T_k(1,:), [56 2]); 	%56 rows, 2 columns 
%showShapes(X', 1, []);
%===============================

 
 fprintf(' done! \n');

%========= PART 2: STATISTICAL SHAPE MODEL ==========
 fprintf('\n Procrustes analisys....');
%Apply the procrustes analysis to the transformation to register the mean shape to the 
%dataset
[V, Phi_k] = procrustesAnalysis(Phi_k, 0.01);
showShapes(V, 2, []);
title('Mean shape');
%showShapes(Phi_k, 3, []);

%== use with initializeDataSetHands2() ==
% [V, Phi_k] = procrustesAnalysis2(Phi_k, 0.1);
% Y = reshape(V, [56 2]); 
% showShapes(Y', 2, []);
%===============================
 fprintf(' done! \n');

 %=========  PART 3: VARIATIONS ==========
  fprintf('\n Principal component analisys....');
% calculate the principal components analysis of the shapes
[Psi_k, lambda_k] = principalComponentAnalysis(Phi_k, V);
 fprintf(' done! \n');



