%configuration of the data
%Source:	http://www2.imm.dtu.dk/pubdb/views/publication_details.php?id=403

function [shapes, phi] = initializeDataSetHands2()

% Following the autor’s explaination: The file handshapes.txt contains
% the subset of hands used for the note alls formatet as xxxyyy, each is 56 points i.e. 112 rows and
% one column per shape, 40 shapes. The string thus includes 4480 floating point coordinates. The
% first 2240 numbers are the x coordinates, the second half the corresponding y coordinates. The
% first 40 numbers represent the x-coordinates for all shapes for the first landmark, the second 40
% for the second landmark until landmark 56. 


	shapes = load('shapes.txt')';

	size(shapes);
	[rows, cols] = size(shapes);

	phi = shapes;

end

