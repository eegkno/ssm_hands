%  This file is used to run all the codes
%
% input
%  - shapes                      The shapes to apply  procrustes
%  - convergence           Criteirum to evaluate 
%  - ms                               Optional parameter to use a initial mean shape
%
% output
%  - meanShape           Final mean shape after the analysis
%  - shapes                     Transformations
%
%
%  By             Edgar Garcia Cano
%  Created        October 24, 2014
%
%  References
%                 http://www.mathworks.com/help/stats/procrustes.html?refresh=true
%

%% Initialization

function [meanShape, shapes] = procrustesAnalysis(shapes, convergence, ms)


if nargin<2, error('procrustesAnalysis.m error! Not enough input parameters.'); end;
if (nargin==3)
      meanShapes(1, :) = ms;
else   
      meanShapes(1, :) = shapes(1, :);
end  

i = 0;

cost = [ convergence+1 ];
while (i == 0 | cost(i) > convergence) 
   i = i + 1;
   %fprintf(' %d  \n', i );
   % apply procrustes analysis
   for j = 1:size(shapes, 1)
      
      X = reshape(shapes(j,:), [56 2] );                    %56 rows, 2 columns 
      Y = reshape(meanShapes(i,:), [56 2] );   %56 rows, 2 columns 

      [d,Z] = procrustes( X', Y');

       Z = reshape(Z', [1, 112]);                                     %1 row, 112 columns

      %assign transformations
      shapes(j, :) = Z;   

   end;
   
   % find the new mean shape
   meanShapes(i+1,:) = mean(shapes);

   % calculate the cost between the current mean  and the i-1 shapes
   if (i ~= 1)
      cost(i) = sum(sum((meanShapes(i+1,:) - meanShapes(i,:)).^2));
   end;
   
end;


meanShape = meanShapes(i+1,:);

end