%	This file is used to run them all
%
%
%	By 			Edgar Garcia Cano
%	Created 		October 24, 2014
%	Modifications


%% Initialization
clear all ; close all; clc

%Adding current project path directories
addpath('core');
addpath('dataset');
addpath('extra/CPD/core');
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
 fprintf('\nLoading datset....');
%%Generate dataset
[T_k, Phi_k] = initializeDataSetHands();
showShapes(T_k, 2);
title('Initial dataset');
% X = reshape(T_k(1,:), [56 2]); 	%56 rows, 2 columns 
% size(X')
% showShapes(X', 2, []);

 fprintf(' done! \n');
%===============================

%% ================= Part 2: CPD registration ============================
 fprintf('\CPD registration....');

% Set the options
opt.viz=0;          % show every iteration
opt.normalize=1;    % normalize to unit variance and zero mean before registering (default)

 [meanShape, shapes] = cpdRegistration(Phi_k, 0.01, opt)

 fprintf(' done! \n');
%===============================


%========= PART 3: STATISTICAL SHAPE MODEL ==========
 fprintf('\nProcrustes analysis....');
%Apply the procrustes analysis to the transformation to register the mean shape to the 
%dataset
[V, Phi_k] = procrustesAnalysis(shapes, 0.1, meanShape);
showShapes(V, 4 );
title('Mean shape');


 fprintf(' done! \n');
%===============================


 %=========  PART 4: VARIATIONS ==========
  fprintf('\nPrincipal component analisys....');
% calculate the principal components analysis of the shapes
[Psi_k, lambda_k] = principalComponentAnalysis(Phi_k, V);

%Plot the the most significant eigevalues
plotEigenvalues(lambda_k(1:20), 10);


%Plot the distribution of the most significant modes
plotPrincipalModes( V, Psi_k, lambda_k, 3, 12);

fprintf(' done! \n');

%===============================

%Checking compactness
modes = 5;
fprintf('\nCompactness = %d  using %d modes\n', compactness(lambda_k, modes ), modes);
modes = 6;
fprintf('\nCompactness = %d  using %d modes\n', compactness(lambda_k, modes ), modes);
modes = 7;
fprintf('\nCompactness = %d  using %d modes\n', compactness(lambda_k, modes ), modes);
modes = 8;
fprintf('\nCompactness = %d  using %d modes\n', compactness(lambda_k, modes ), modes);
modes = 9;
fprintf('\nCompactness = %d  using %d modes\n', compactness(lambda_k, modes ), modes);
modes = 10;
fprintf('\nCompactness = %d  using %d modes\n', compactness(lambda_k, modes ), modes);


 fprintf('\n');
%Removing current project path 
rmpath('core');
rmpath('dataset');
rmpath('extra/CPD/core');
rmpath('utilities');
