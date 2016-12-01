function ENH = getCoords(x, y, z, IP, R, r2)
	% a computation of the ground coordinates of all the model points
	ENH = zeros(r2,3); %where r2 is the number of model points

	lm = IP(1,1) %lambda, scale value 
  e = IP(5,1);
  n = IP(6,1);
  h = IP(7,1);

	for m = 1: r2
		ENH(m,1) = lm * ( R(1,1)*x(m,1) + R(1,2)*y(m,1) + R(1,3)*z(m,1) ) + e; %Easting E
		ENH(m,2) = lm * ( R(2,1)*x(m,1) + R(2,2)*y(m,1) + R(2,3)*z(m,1) ) + n; %Northing N
		ENH(m,3) = lm * ( R(3,1)*x(m,1) + R(3,2)*y(m,1) + R(3,3)*z(m,1) ) + h; %Height H
	end

end