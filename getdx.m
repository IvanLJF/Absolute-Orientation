function dx = getdx(A,L)
	%get the matrix of the unknowns PARAMETERS

	qxx = inv( A' * A );

	% The error matrix dl
	dl = A' * L;   
    
    %the -L applied results in the formation of the least square solution 
	
	% matrix of unknowns in the order 
		%% dw2, dp2, dk2, dBY, dBZ, dXi, dYi, dZi
		  %% these unknowns in the matrix dx are computed as change values

  dx = qxx * dl;
  
end