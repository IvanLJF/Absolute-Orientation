function drk = getKappaDiff(w, p, k)
	%returns the matrix of differentials R w.r.t angle kappa :
	
	% replacement elements elements used for shorter code:

	a1 = cos(w);
	a2 = cos(p);
	a3 = cos(k);  %cosines of rotational

	b1 = sin(w);
	b2 = sin(p);
	b3 = sin(k);  %sines of rotational

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