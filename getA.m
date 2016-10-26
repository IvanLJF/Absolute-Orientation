function A = getA(IP, x, y, z, E, N, H, R, drw, drp, drk, lm, n)
  % returns the A matrix using the three control points

	% consider devising a loop for control points and iterating to get the seven unknown parameters,
	% then subsequently calculating the ground coordinates of any number of model points
  A = zeros(n*2, 10)
  
  for m = 1:n
  	%index navigations
  	a = m*3

  	% #each model point and corresponding GCP result in three equations
  	
  	%%elements of differentials of F1

  	A(a-2,1) = -( R(1,1)*x(m,1) + R(1,2)*y(m,1) + R(1,3)*z(m,1) );
  	A(a-2,2) = -lm * ( drw(1,1)*x(m,1) + drw(1,2)*y(m,1) + drw(1,3)*z(m,1) );
  	A(a-2,3) = -lm * ( drp(1,1)*x(m,1) + drp(1,2)*y(m,1) + drp(1,3)*z(m,1) );
  	A(a-2,4) = -lm * ( drk(1,1)*x(m,1) + drk(1,2)*y(m,1) + drk(1,3)*z(m,1) );
  	A(a-2,5) = -1;
  	A(a-2,6) = 0;
  	A(a-2,7) = 0;
  	A(a-2,8) = 1;
  	A(a-2,9) = 0;
  	A(a-2,10) = 0;

  	%%elements of differentials of F2
  	A(a-1,1) = -( R(2,1)*x(m,1) + R(2,2)*y(m,1) + R(2,3)*z(m,1) );
  	A(a-1,2) = -lm * ( drw(2,1)*x(m,1) + drw(2,2)*y(m,1) + drw(2,3)*z(m,1) );
  	A(a-1,3) = -lm * ( drp(2,1)*x(m,1) + drp(2,2)*y(m,1) + drp(2,3)*z(m,1) );
  	A(a-1,4) = -lm * ( drk(2,1)*x(m,1) + drk(2,2)*y(m,1) + drk(2,3)*z(m,1) );
  	A(a-1,5) = 0;
  	A(a-1,6) = -1;
  	A(a-1,7) = 0;
  	A(a-1,8) = 0;
  	A(a-1,9) = 1;
  	A(a-1,10) = 0;

  	%%elements of differentials of F3
  	A(a,1) = -( R(3,1)*x(m,1) + R(3,2)*y(m,1) + R(3,3)*z(m,1) );
  	A(a,2) = -lm * ( drw(3,1)*x(m,1) + drw(3,2)*y(m,1) + drw(3,3)*z(m,1) );
  	A(a,3) = -lm * ( drp(3,1)*x(m,1) + drp(3,2)*y(m,1) + drp(3,3)*z(m,1) );
  	A(a,4) = -lm * ( drk(3,1)*x(m,1) + drk(3,2)*y(m,1) + drk(3,3)*z(m,1) );
  	A(a,5) = 0;
  	A(a,6) = 0;
  	A(a,7) = -1;
  	A(a,8) = 0;
  	A(a,9) = 0;
  	A(a,10) = 1;

		% jump to GCP 61, handle as a conditional
  	% if m == 3
  	% 	%%elements of differentials of F1

	  % 	A(a-2,1) = -( R(1,1)*x(6,1) + R(1,2)*y(6,1) + R(1,3)*z(6,1) );
	  % 	A(a-2,2) = -lm * ( drw(1,1)*x(6,1) + drw(1,2)*y(6,1) + drw(1,3)*z(6,1) );
	  % 	A(a-2,3) = -lm * ( drp(1,1)*x(6,1) + drp(1,2)*y(6,1) + drp(1,3)*z(6,1) );
	  % 	A(a-2,4) = -lm * ( drk(1,1)*x(6,1) + drk(1,2)*y(6,1) + drk(1,3)*z(6,1) );
	  % 	A(a-2,5) = -1;
	  % 	A(a-2,6) = 0;
	  % 	A(a-2,7) = 0;
	  % 	A(a-2,8) = 1;
	  % 	A(a-2,9) = 0;
	  % 	A(a-2,10) = 0;

	  % 	%%elements of differentials of F2
	  % 	A(a-1,1) = -( R(2,1)*x(6,1) + R(2,2)*y(6,1) + R(2,3)*z(6,1) );
	  % 	A(a-1,2) = -lm * ( drw(2,1)*x(6,1) + drw(2,2)*y(6,1) + drw(2,3)*z(6,1) );
	  % 	A(a-1,3) = -lm * ( drp(2,1)*x(6,1) + drp(2,2)*y(6,1) + drp(2,3)*z(6,1) );
	  % 	A(a-1,4) = -lm * ( drk(2,1)*x(6,1) + drk(2,2)*y(6,1) + drk(2,3)*z(6,1) );
	  % 	A(a-1,5) = 0;
	  % 	A(a-1,6) = -1;
	  % 	A(a-1,7) = 0;
	  % 	A(a-1,8) = 0;
	  % 	A(a-1,9) = 1;
	  % 	A(a-1,10) = 0;

	  % 	%%elements of differentials of F3
	  % 	A(a,1) = -( R(3,1)*x(6,1) + R(3,2)*y(6,1) + R(3,3)*z(6,1) );
	  % 	A(a,2) = -lm * ( drw(3,1)*x(6,1) + drw(3,2)*y(6,1) + drw(3,3)*z(6,1) );
	  % 	A(a,3) = -lm * ( drp(3,1)*x(6,1) + drp(3,2)*y(6,1) + drp(3,3)*z(6,1) );
	  % 	A(a,4) = -lm * ( drk(3,1)*x(6,1) + drk(3,2)*y(6,1) + drk(3,3)*z(6,1) );
	  % 	A(a,5) = 0;
	  % 	A(a,6) = 0;
	  % 	A(a,7) = -1;
	  % 	A(a,8) = 0;
	  % 	A(a,9) = 0;
	  % 	A(a,10) = 1;

	  % end

	end

end