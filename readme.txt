Project Relative Orientation:
----------------------------

The code hosted in this folder executes the Photogrammetric process of absolute orientation in bundle adjustment.
The process uo using a seven parameter transformation to relate a model to a given ground coordinate system.

Using model point coordinates (from the relative orientation process) , the objective is to deduce the seven absolute orientation parameters and therefore compute the ground coordinates 
of any other model point:

The three ground coordinates are of 3 control points (GCPs) - this is the minimum for an iterative solution.
The unknown 7 parameters to be determined are:
	
	The scale component
	-lambda - scales the model into the ground coordinate system

	The orientation elements of the model relative to ground
	-w (omega) , p (phi), k (kappa)

	The ground coordinates of the origin of the model coordinate system.
	-XO, YO, ZO

This procedure can be executed together with the Relative_Orientation process for a complete bundle Adjustment process.

_____________________________
The University of Nairobi,
Department of Geospatial and Space Technology.
FGE 442- PHOTOGRAMMETRY 2B

-----------------------------
Code by: Konuko Jodom
CC: Peter Nthei
Lec: Dr. Wakoli 