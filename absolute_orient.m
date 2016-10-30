clc

format short
% DATA MATRIX

%control model point coordinates
xc = [
  210.47
  219.92
  594.13
];

yc = [
  896.96
  507.34
  243.06
];

zc = [
  174.54
  195.46
  206.49
];

%model coordinates for all the six
x= [
  210.47
  219.92
  229.82
  578.42
  587.52
  594.13
];

y=[
  896.96
  507.34
  206.32
  849.63
  546.88
  243.06
];

z=[
  174.54
  195.46
  217.02
  174.46
  188.91
  206.49
];

%Ground point xoordinates: the GCPs
N = [
  223343.72
  223345.03
  223619.54
];

E = [
  670296.32
  670542.31
  670745.89
];

H = [
  1243.65
  1259.22
  1267.65
];

%matrix of initial parameters IP
IP = getIP(xc, yc, zc);

w = IP(4,1);
p = IP(5,1);
k = IP(6,1);

%rotational matrix Rs
R = getR(w, p, k);

%differentials of rotational elements

drw = getOmegaDiff(w, p, k);

drp = getPhiDiff(w, p, k);

drk = getKappaDiff(w, p, k);

%number of data points n :
r = length(N); %  = len(E) = len(H)


%first iteration values

A = getA(IP, xc, yc, zc, E, N, H, R, drw, drp, drk, r)

L = getL(IP, xc, yc, zc, E, N, H, R, r)

% dx = getdx(A,L);


% % residual matrix v
% v = - L - (A * dx);

% sigma = sqrt(v' * v );

% exx = sigma * inv(A' * A);

% variances = diag(exx);

% deviations = sqrt(variances);

%%%%-------------------------------------%%%

% subsequent iteration to convergence
% while (dx - getdx(A,L) ~= zeros(length(dx),1))
% for i = 1:10
% 	% change in unknowns BY, BZ, Omega(w), Phi(p) and Kappa(k) respectively are:
% 	cw = dx(1:1);
% 	cp = dx(2:1);
% 	ck = dx(3:1);

% 	cBY = dx(4:1);
% 	cBZ = dx(5:1);

% 	% changes in the model coordinates
  
%   cXI;  cYI;  cZI;

% 	p = 6;
% 	for m = 1: 6

% 		cXI(m,1) = dx(p,1);
% 		cYI(m,1) = dx(p+1,1);
% 	  cZI(m,1) = dx(p+2,1);

% 	  p = p + 3;
% 	end

% 	%modified values:  effecting the changes:: value + change in value.

% 	%rotationals
% 	w = w + cw
% 	p = p + cp
% 	k = k + ck

% 	% base components
% 	BY = BY + cBY
% 	BZ = BZ + cBZ

% 	% model coordinates
% 	XI = XI + cXI;
% 	YI = YI + cYI;
% 	ZI = ZI + cZI;

%   %rotational matrix R
%   R = getR(w, p, k)

%   %differential
% 	drw = getOmegaDiff(w, p, k)
% 	drp = getPhiDiff(w, p, k)
% 	drk = getKappaDiff(w, p, k)

% 	A = getA(x1, y1, x2, y2, BX, BY, BZ, XI, YI, ZI, R, drw, drp, drk, f, n);

% 	L = getL(x1, y1, x2, y2, BX, BY, BZ, XI, YI, ZI, R, f, n);

% 	dx = getdx(A,L)

% end
