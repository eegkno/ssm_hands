%configuration of the data
%Source:	http://www2.imm.dtu.dk/pubdb/views/publication_details.php?id=403

function [shapes, phi] = initializeDataSetHands()

% Following the autor’s explaination: The file handshapes.txt contains
% the subset of hands used for the note alls formatet as xxxyyy, each is 56 points i.e. 112 rows and
% one column per shape, 40 shapes. The string thus includes 4480 floating point coordinates. The
% first 2240 numbers are the x coordinates, the second half the corresponding y coordinates. The
% first 40 numbers represent the x-coordinates for all shapes for the first landmark, the second 40
% for the second landmark until landmark 56. 


X = load('shapes.txt');


%first index: 56 points
%second index: 2 coordinates, x and y
%third index: 40 shapes

shapesAux = reshape(X,[56 2 40]);
%plot(shapesAux(:,1,1), shapesAux(:,2,1) );

[cols, coord, rows] = size(shapesAux);

tmp = zeros([coord, cols, rows]);
shapes = zeros([coord, cols, rows]);
phi = zeros([coord, cols, rows]);

%shapesAux are changed in order to follow the next indices, that is necesary in order
%to use the algorithms.

%first index:  coordinates, x and y
%second index: points
%third index:  shapes

for i=1:rows
	tmp(:,:,i) = shapesAux(:,:,i)';
end

shapes = tmp;
%plot(shapes(1,:,2)', shapes(2,:,2)' )

