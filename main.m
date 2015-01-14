%	This file is used to run them all
%
%
%	By 				Edgar Garcia Cano
%	Created 		October 24, 2014
%	Modifications


%% Initialization
clear all ; close all; clc

%Adding current project path directories
addpath('core');
addpath('dataset');
addpath('utilities');

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
%$ [T_k, Phi_k] = initializeDataSetHands();
%$ showShapes(T_k, 1, []);
%$ title('Initial dataset');

%== use with initializeDataSetHands2() ==
[T_k2, Phi_k2] = initializeDataSetHands2();
showShapes2(T_k2, 2, []);
title('Initial dataset2');
% X = reshape(T_k(1,:), [56 2]); 	%56 rows, 2 columns 
% size(X')
% showShapes2(X', 2, []);
%===============================

 fprintf(' done! \n');


%========= PART 2: STATISTICAL SHAPE MODEL ==========
 fprintf('\n Procrustes analisys....');
%Apply the procrustes analysis to the transformation to register the mean shape to the 
%dataset
%$ [V, Phi_k] = procrustesAnalysis(Phi_k, 0.01);
%$ showShapes(V, 11, []);
%$ title('Mean shape');

%== use with initializeDataSetHands2() ==
[V2, Phi_k2] = procrustesAnalysis2(Phi_k2, 0.1);
showShapes2(V2, 21, []);
title('Mean shape2');

%===============================
 fprintf(' done! \n');


 %=========  PART 3: VARIATIONS ==========
  fprintf('\n Principal component analisys....');
% calculate the principal components analysis of the shapes
%$ [Psi_k, lambda_k] = principalComponentAnalysis(Phi_k, V);
[Psi_k2, lambda_k2] = principalComponentAnalysis2(Phi_k2, V2);

plotPrincipalModes( V2, Psi_k2, lambda_k2, 3)

 fprintf(' done! \n');


%Removing current project path 
rmpath('core');
rmpath('dataset');
rmpath('utilities');
