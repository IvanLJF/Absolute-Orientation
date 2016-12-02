function A = getA_control(IP, xc, yc, zc, R, drw, drp, drk, r)
  % returns the A matrix using the three control points

  % from the initial parameter matrix IP::  
  %scale factor, lambda, lm
  lm = IP(1,1);
  
  A = zeros(r*3, 7);
  
  for m = 1:r
  	
  	a = m*3; %index navigations

  	% #each model point and corresponding GCP result in three equations
  	
  	%%elements of differentials of F1

  	A(a-2,1) = -( R(1,1)*xc(m,1) + R(1,2)*yc(m,1) + R(1,3)*zc(m,1) );  %lambda shift
  	A(a-2,2) = -lm * ( drw(1,1)*xc(m,1) + drw(1,2)*yc(m,1) + drw(1,3)*zc(m,1) );  %omega shift
  	A(a-2,3) = -lm * ( drp(1,1)*xc(m,1) + drp(1,2)*yc(m,1) + drp(1,3)*zc(m,1) );  %phi shift
  	A(a-2,4) = -lm * ( drk(1,1)*xc(m,1) + drk(1,2)*yc(m,1) + drk(1,3)*zc(m,1) );  %kappa shift
  	A(a-2,5) = -1;  %shift e
  	A(a-2,6) = 0;  %shift n
  	A(a-2,7) = 0;  %shift h

  	%%elements of differentials of F2
  	A(a-1,1) = -( R(2,1)*xc(m,1) + R(2,2)*yc(m,1) + R(2,3)*zc(m,1) );
  	A(a-1,2) = -lm * ( drw(2,1)*xc(m,1) + drw(2,2)*yc(m,1) + drw(2,3)*zc(m,1) );
  	A(a-1,3) = -lm * ( drp(2,1)*xc(m,1) + drp(2,2)*yc(m,1) + drp(2,3)*zc(m,1) );
  	A(a-1,4) = -lm * ( drk(2,1)*xc(m,1) + drk(2,2)*yc(m,1) + drk(2,3)*zc(m,1) );
  	A(a-1,5) = 0;
  	A(a-1,6) = -1;
  	A(a-1,7) = 0;

  	%%elements of differentials of F3
  	A(a,1) = -( R(3,1)*xc(m,1) + R(3,2)*yc(m,1) + R(3,3)*zc(m,1) );
  	A(a,2) = -lm * ( drw(3,1)*xc(m,1) + drw(3,2)*yc(m,1) + drw(3,3)*zc(m,1) );
  	A(a,3) = -lm * ( drp(3,1)*xc(m,1) + drp(3,2)*yc(m,1) + drp(3,3)*zc(m,1) );
  	A(a,4) = -lm * ( drk(3,1)*xc(m,1) + drk(3,2)*yc(m,1) + drk(3,3)*zc(m,1) );
  	A(a,5) = 0;
  	A(a,6) = 0;
  	A(a,7) = -1;

	end

end