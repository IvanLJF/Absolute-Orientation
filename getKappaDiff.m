function drk = getKappaDiff(w2, p2, k2)
	%returns the matrix of differentials R w.r.t angle kappa :
	
	% replacement elements elements used for shorter code:

	a1 = cos(w2);
	a2 = cos(p2);
	a3 = cos(k2);  %cosines of rotational

	b1 = sin(w2);
	b2 = sin(p2);
	b3 = sin(k2);  %sines of rotational

	drk(1,1) = -a2*b3;
	drk(1,2) =  a1*a3 - b1*b2*b3;
	drk(1,3) =  b1*a3 + a1*b2*b3;

	drk(2,1) = -a2*a3;
	drk(2,2) = -a1*b3 - b1*b2*a3;
	drk(2,3) = -b1*b3 + a1*b2*a3;

	drk(3,1) =  0;
	drk(3,2) =  0;
	drk(3,3) =  0;

end