function IP = getIP(xc, yc, zc)
  % initial parameters are then estimated as:

	%assumed origin of the model coordinate system
	XO = 0;
	YO = 0;
	ZO = 0;

	%assumed values of the rotations of the model in x, y, and z axis relative to the ground
	w = 0;  %rotation in x , womega, w
	p = 0;  %roatation in y, phi, p

  % write funcs to compute the IPs below -------

	%rotation in z, kappa, k
	k = 0 ; 

	%scale factor: lambda, lm
	lm = 1;


 IP = [
		XO
		YO
		ZO
		w
	  p
	  k
	  lm	
	];


end