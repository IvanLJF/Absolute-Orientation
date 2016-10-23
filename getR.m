function R = getR(w2, p2, k2)
	%returns the rotational matrix R:
	R(1,1) = cos(p2)*cos(k2);
	R(1,2) = cos(w2)*sin(k2) + sin(w2)*sin(p2)*cos(k2);
	R(1,3) = sin(w2)*sin(k2) - cos(w2)*sin(p2)*cos(k2);

	R(2,1) = -cos(p2)*sin(k2);
	R(2,2) = cos(w2)*cos(k2) - sin(w2)*sin(p2)*sin(k2); %cos(w2)*sin(p2)*sin(k2);
	R(2,3) = sin(w2)*cos(k2) + cos(w2)*sin(p2)*sin(k2);

	R(3,1) = sin(p2);
	R(3,2) = -sin(w2)*cos(p2);
	R(3,3) = cos(w2)*cos(p2);
end