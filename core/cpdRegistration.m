%  This file is used to run all the codes
%
%
%  By                         Edgar Garcia Cano
%  Created              March 9, 2015
%  Modifications
%  References
%                 https://sites.google.com/site/myronenko/research/cpd
%

%% Initialization

function [meanShape, shapes] = cpdRegistration(shapes, convergence, opt)





% registering the mean shape to the dataset
i = 0;
meanShapes(1,:) = shapes(1, :);

cost = [ convergence+1 ];
while (i == 0 | cost(i) > convergence) 
   i = i + 1;
    %fprintf(' %d  \n', i );

      % apply procrustes analysis
      for j = 1:size(shapes, 1)
         
            X = reshape(shapes(j,:), [56 2] );             %295 rows, 3 columns
            Y = reshape(meanShapes(i,:), [56 2] );   %295 rows, 3 columns

            % registering X to Y
            Transform=cpd_register(Y,X, opt);

            %[d,Z] = procrustes( X', Y' );
            Z = reshape(Transform.Y, [1 112]);

            %assign transformations
            shapes(j,:) = Z;
         
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