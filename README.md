SSM_HANDS (version 1.0.0)
===================


 WHAT IS IT?
-----------
>This implementation generates a statistical shape model (mean shape and its variations) from a hand's dataset. The dataset was obtained from http://www.imm.dtu.dk/~aam/.

>Following the author’s explanation: The file shapes.txt contains the subset of hands used for the note alls formatet as xxxyyy, each is 56 points i.e. 112 rows and one column per shape, 40 shapes. The string thus includes 4480 floating point coordinates. The first 2240 numbers are the x coordinates, the second half the corresponding y coordinates. The first 40 numbers represent the x-coordinates for all shapes for the first landmark, the second 40 for the second landmark until landmark 56. 

HOW TO USE
-------------
>The *main.m* file in the root directory is the script used to run them all. Tha data is loaded from the **dataset** directory, and the main scripts are in the **core** directory. 

-------------


REFERENCE
-------------

>1. [An Introduction to Active Shape Models.](http://personalpages.manchester.ac.uk/staff/timothy.f.cootes/papers/asm_overview.pdf) Tim Cootes
>2. [A Brief Introduction to Statistical Shape Analysis.](http://www2.imm.dtu.dk/pubdb/views/publication_details.php?id=403) Mikkel B. Stegmann, David Delgado Gomez
>3. [Shape Model Formulation](http://www2.imm.dtu.dk/~aam/main/node12.html)

-------------
This document was last modified on : Jan. 18th, 2015.


