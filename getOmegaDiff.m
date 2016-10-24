function drw = getOmegaDiff(w, p, k)
	%returns the matrix of differentials R w.r.t angle omega :
	
	% replacement elements elements used for shorter code:

	a1 = cos(w);
	a2 = cos(p);
	a3 = cos(k);  %cosines of rotational

	b1 = sin(w);
	b2 = sin(p);
	b3 = sin(k);  %sines of rotational

	drw(1,1) = 0;
	drw(1,2) = -b1*b3 + a1*b2*a3;
	drw(1,3) = a1*b3 + b1*b2*a3;

	drw(2,1) = 0;
	drw(2,2) = -b1*a3 - a1*b2*b3;
	drw(2,3) = a1*a3 - b1*b2*b3;

	drw(3,1) = 0;
	drw(3,2) = -a1*a2;
	drw(3,3) = -b1*a2;

end