function drp = getPhiDiff(w, p, k)
	%returns the matrix of differentials R w.r.t angle phi :
	
	% replacement elements ai,bi used for shorter code:

	a1 = cos(w);
	a2 = cos(p);
	a3 = cos(k);  %cosines of rotational

	b1 = sin(w);
	b2 = sin(p);
	b3 = sin(k);  %sines of rotational

	drp(1,1) = -b2*a3;
	drp(1,2) =  b1*a2*a3;
	drp(1,3) = -a1*a2*a3;

	drp(2,1) =  b2*b3;
	drp(2,2) = -b1*a2*b3;
	drp(2,3) =  a1*a2*b3;

	drp(3,1) =  a2;
	drp(3,2) =  b1*b2;
	drp(3,3) = -a1*b2;

end