function L = getL(IP, xc, yc, zc, E, N, H, R, r)
	% from the initial parameter matrix IP::

	%scale factor, lambda, lm
	lm = IP(1,1);
	%shifts in X, Y, Z respectively
	e = IP(5,1);
	n = IP(6,1);
	h = IP(7,1);

	% compute the L matrix 
	L = zeros(r*3,1);

	for m=1:r

		a= m*3; %index navigations

		L(a-2,1) = E(m,1) - lm * ( R(1,1)*xc(m,1) + R(1,2)*yc(m,1) + R(1,3)*zc(m,1) ) - e;		
		L(a-1,1) = N(m,1) - lm * ( R(2,1)*xc(m,1) + R(2,2)*yc(m,1) + R(2,3)*zc(m,1) ) - n;			
		L(a,1)   = H(m,1) - lm * ( R(3,1)*xc(m,1) + R(3,2)*yc(m,1) + R(3,3)*zc(m,1) ) - h;	
	
	end
end