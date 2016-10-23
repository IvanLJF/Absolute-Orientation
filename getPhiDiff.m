function drp = getPhiDiff(w2, p2, k2)
	%returns the matrix of differentials R w.r.t angle phi :
	
	% replacement elements elements used for shorter code:

	a1 = cos(w2);
	a2 = cos(p2);
	a3 = cos(k2);  %cosines of rotational

	b1 = sin(w2);
	b2 = sin(p2);
	b3 = sin(k2);  %sines of rotational

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