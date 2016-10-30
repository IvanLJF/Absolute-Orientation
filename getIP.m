function IP = getIP(xc, yc, zc)
  % initial parameters are then estimated as:

	% %rotation in z, kappa, k
	% k = 0 ; 

	% %scale factor: lambda, lm
	% lm = 1;

	%scale factor
	lm = 0;

	%translations
	e = 0;
	n = 0;
	h = 0;

	%rotations
	w = 0;
	p = 0;
	k = 30;


  IP = [
		lm
		e
	  n
	  h
	  w
	  p
	  k
	];

end