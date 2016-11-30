function L = getL(IP, x, y, z, E, N, H, R, r2)
	% from the initial parameter matrix IP::

	%scale factor, lambda, lm
	lm = IP(1,1);
	%shifts in X, Y, Z respectively
	e = IP(5,1);
	n = IP(6,1);
	h = IP(7,1);

	% compute the L matrix 
	FL = zeros(r2*3,1);

	for m=1:r2

		a= m*3; %index navigations

		FL(a-2,1) = E(m,1) - lm * ( R(1,1)*x(m,1) + R(1,2)*y(m,1) + R(1,3)*z(m,1) ) + e;		
		FL(a-1,1) = N(m,1) - lm * ( R(2,1)*x(m,1) + R(2,2)*y(m,1) + R(2,3)*z(m,1) ) + n;			
		FL(a,1)   = H(m,1) - lm * ( R(3,1)*x(m,1) + R(3,2)*y(m,1) + R(3,3)*z(m,1) ) + h;	
	
	end
end