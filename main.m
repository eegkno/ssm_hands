%	This file is used to run all the codes
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


%%Generate dataset
[T_k, Phi_k] = initializeDataSetHands();
%showShapes(T_k, 1, []);

%========= STATISTICAL SHAPE MODEL ==========

% =1= Procrustes analysis to remove any bias in the transformation, including translations and
% rotations
Phi_k = T_k;

%Apply the procrustes analysis to the transformation to register the mean shape to the 
%dataset
[V, Phi_k] = procrustesAnalysis(Phi_k, 0.01);
showShapes(V, 2, []);
showShapes(Phi_k, 3, []);
