function R = getR(w, p, k)
	%returns the rotational matrix R:
	R(1,1) = cos(p)*cos(k);
	R(1,2) = cos(w)*sin(k) + sin(w)*sin(p)*cos(k);
	R(1,3) = sin(w)*sin(k) - cos(w)*sin(p)*cos(k);

	R(2,1) = -cos(p)*sin(k);
	R(2,2) = cos(w)*cos(k) - sin(w)*sin(p)*sin(k);
	R(2,3) = sin(w)*cos(k) + cos(w)*sin(p)*sin(k);

	R(3,1) = sin(p);
	R(3,2) = -sin(w)*cos(p);
	R(3,3) = cos(w)*cos(p);
end