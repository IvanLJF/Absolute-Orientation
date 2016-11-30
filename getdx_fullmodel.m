function fdx = getdx_fullmodel(FA,FL)
	%get the matrix of the unknowns PARAMETERS

	qxx = inv( FA' * FA );

	% The error matrix dl
	dl = FA' * FL;   
    
    %the -L applied results in the formation of the least square solution 
	
	% matrix of unknowns in the order 
		%% dw2, dp2, dk2, dBY, dBZ, dXi, dYi, dZi
		  %% these unknowns in the matrix dx are computed as change values

  fdx = qxx * dl;
  
end