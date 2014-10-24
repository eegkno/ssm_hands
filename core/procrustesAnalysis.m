%  This file is used to run all the codes
%
%
%  By             Edgar Garcia Cano
%  Created        October 24, 2014
%  Modifications
%  References
%                 http://www.mathworks.com/help/stats/procrustes.html?refresh=true
%

%% Initialization

function [meanShape, shapes] = procrustesAnalysis(shapes, convergence)


% registering the mean shape to the dataset
i = 0;
meanShapes(:, :, 1) = shapes(:, :, 1);

cost = [ convergence+1 ];
while (i == 0 | cost(i) > convergence) 
   i = i + 1;
   
   % apply procrustes analysis
   for j = 1:size(shapes, 3)
      
      [d,Z] = procrustes( shapes(:, :, j), meanShapes(:, :, i));

      %assign transformations
      shapes(:, :, j) = Z;   
      
   end;
   
   % find the new mean shape
   meanShapes(:, :, i+1) = mean(shapes, 3);
   
   % calculate the cost between the current mean  and the i-1 shapes
   if (i ~= 1)
      cost(i) = sum(sum((meanShapes(:, :, i-1) - meanShapes(:, :, i)).^2));
   end;
   
end;

meanShape = meanShapes(:, :, i+1);

end