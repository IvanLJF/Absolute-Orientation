function dx = getdx(A,L)
	%get the matrix of the unknowns PARAMETERS

	d = ones(9,1);
	% W is the weight matrix : ones in the main diagonal, equal weight matrix
  W = diag(d)

	N = A' * W * A;

	% Matrix of coefficients Qxx = inv(N)
	qxx = inv(N);

	% The error matrix dl
	dl = A' * W * L;   
    
    %the -L applied results in the formation of the least square solution 
	
	% matrix of unknowns in the order 
		%% dw2, dp2, dk2, dBY, dBZ, dXi, dYi, dZi
		  %% these unknowns in the matrix dx are computed as change values

  dx = qxx * dl;
  
end