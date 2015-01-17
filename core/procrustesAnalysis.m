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

function [meanShape, shapes] = procrustesAnalysis2(shapes, convergence)


% registering the mean shape to the dataset
i = 0;
meanShapes(1, :) = shapes(1, :);


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