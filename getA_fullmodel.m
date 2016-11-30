function FA = getA_fullmodel(IP, x, y, z, E, N, H, R, drw, drp, drk, r2)
  % returns the A matrix using the three control points

  % from the initial parameter matrix IP::

  %scale factor, lambda, lm
  lm = IP(1,1);
  
  FA = zeros(r2*3, 10);
  
  for m = 1:r2
  	
  	a = m*3; %index navigations

  	% #each model point and corresponding GCP result in three equations
  	
  	%%elements of differentials of F1

  	FA(a-2,1) = -( R(1,1)*x(m,1) + R(1,2)*y(m,1) + R(1,3)*z(m,1) );  %lambda shift
  	FA(a-2,2) = -lm * ( drw(1,1)*x(m,1) + drw(1,2)*y(m,1) + drw(1,3)*z(m,1) );  %omega shift
  	FA(a-2,3) = -lm * ( drp(1,1)*x(m,1) + drp(1,2)*y(m,1) + drp(1,3)*z(m,1) );  %phi shift
  	FA(a-2,4) = -lm * ( drk(1,1)*x(m,1) + drk(1,2)*y(m,1) + drk(1,3)*z(m,1) );  %kappa shift
  	FA(a-2,5) = -1;  %shift e
  	FA(a-2,6) = 0;  %shift n
  	FA(a-2,7) = 0;  %shift h
  	FA(a-2,8) = 1;  %shift E
  	FA(a-2,9) = 0;  %shift N
  	FA(a-2,10) = 0; %shift E

  	%%elements of differentials of F2
  	FA(a-1,1) = -( R(2,1)*x(m,1) + R(2,2)*y(m,1) + R(2,3)*z(m,1) );
  	FA(a-1,2) = -lm * ( drw(2,1)*x(m,1) + drw(2,2)*y(m,1) + drw(2,3)*z(m,1) );
  	FA(a-1,3) = -lm * ( drp(2,1)*x(m,1) + drp(2,2)*y(m,1) + drp(2,3)*z(m,1) );
  	FA(a-1,4) = -lm * ( drk(2,1)*x(m,1) + drk(2,2)*y(m,1) + drk(2,3)*z(m,1) );
  	FA(a-1,5) = 0;
  	FA(a-1,6) = -1;
  	FA(a-1,7) = 0;
  	FA(a-1,8) = 0;
  	FA(a-1,9) = 1;
  	FA(a-1,10) = 0;

  	%%elements of differentials of F3
  	FA(a,1) = -( R(3,1)*x(m,1) + R(3,2)*y(m,1) + R(3,3)*z(m,1) );
  	FA(a,2) = -lm * ( drw(3,1)*x(m,1) + drw(3,2)*y(m,1) + drw(3,3)*z(m,1) );
  	FA(a,3) = -lm * ( drp(3,1)*x(m,1) + drp(3,2)*y(m,1) + drp(3,3)*z(m,1) );
  	FA(a,4) = -lm * ( drk(3,1)*x(m,1) + drk(3,2)*y(m,1) + drk(3,3)*z(m,1) );
  	FA(a,5) = 0;
  	FA(a,6) = 0;
  	FA(a,7) = -1;
  	FA(a,8) = 0;
  	FA(a,9) = 0;
  	FA(a,10) = 1;

	end

end