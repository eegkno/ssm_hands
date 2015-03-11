Downloaded from https://github.com/markeroon/CoherentPointDrift

Other implementation of the same paper.
http://www.mathworks.com/matlabcentral/fileexchange/22337-robust-nonrigid-point-set-registration

Apply these two steps before installing

[1] In the file cpd_make.m it was changed the function with 4 output parameter

	============================================
	[pathstr, name, ext, versn] = fileparts(p);
	============================================

to the one with 3 output parameters

	======================================
	[pathstr, name, ext ] = fileparts(p);
	======================================


[2] To compile the follow source codes 

	============================
	cpd_P.
	cpd_Pappmex.c
	cpd_Pcorrespondence.c
	fgt_model.c
	===========================

it was necessary to add the lines:

	===========================
	#include <stdint.h>
	typedef uint16_t char16_t;
	===========================

before the 

	===========================
	#include "mex.h"
	===========================




