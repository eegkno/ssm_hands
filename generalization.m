
%% Initialization
clear all ; close all; clc

%Adding current project path directories
addpath('core');
addpath('dataset');
addpath('utilities');


%% ================= Part 1: Load datasets ============================
fprintf('\nLoading datset....');

[T_kC, Phi_kC] = initializeDataSetHands();

fprintf(' done! \n');


modes = 15;
tableMSE = zeros([ size(T_kC,1), modes - 2 ]);

for m = 1:modes - 2
	for out = 1: size(T_kC,1)

% for m = 1:1
% 	for out = 1: 1

		fprintf(' %d - %d\n', m, out);		
		
		[indices, subData, sampleOut ]  = leaveOneOutPartition(out, Phi_kC);

%% ================= Part 2: Procrustes analysis ============================
		fprintf('\nProcrustes analysis....');

		[VC, subData] = procrustesAnalysis(subData, 0.01);

		fprintf(' done! \n');

%% ================= Part 3: Variations ===============
		fprintf('\nPrincipal component analisys....');

		[Psi_kC, lambda_kC ] = principalComponentAnalysis(subData, VC );

		fprintf(' done! \n');
%% ================= Part 4: Reconstruct the unseen shape using M shape parameters =====
		Psi = Psi_kC(:,1:m);  
%data projected onto eigenspace
		Z = sampleOut - VC;
		b_k = Z*Psi;		
%Approximation
		S = VC + b_k*Psi';
		%showSpine(S, 10, 0);

%% ================= Part 5: Calculate the sum of squares approximation error ============
		D = abs(sampleOut - S).^2;

%% ================= Part 6:  Calculate the mean squared error
 		MSE = sum(D(:))/size(T_kC,1);
		tableMSE(out, m) = MSE;

	end
end