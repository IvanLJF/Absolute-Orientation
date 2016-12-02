clc

%format long
format short
% DATA MATRIX

%control model point coordinates in m,
xc = [
  210.47
  219.92
  594.13
] / 1000;

yc = [
  896.96 
  507.34
  243.06
] / 1000;

zc = [
  174.54
  195.46
  206.49
] / 1000;

%model coordinates for all the six points in mm
x= [
  210.47
  219.92
  229.82
  578.42
  587.52
  594.13
] / 1000;

y=[
  896.96
  507.34
  206.32
  849.63
  546.88
  243.06
] / 1000;

z=[
  174.54
  195.46
  217.02
  174.46
  188.91
  206.49
] / 1000;

%Ground point xoordinates: the GCPs in m
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
IP = getIP(xc, yc, zc, N, E, H);

lm = IP(1,1); %quick access
w = IP(2,1);
p = IP(3,1);
k = IP(4,1);


%rotational matrix Rs
R = getR(w, p, k)';

%differentials of rotational elements

drw = getOmegaDiff(w, p, k);

drp = getPhiDiff(w, p, k);

drk = getKappaDiff(w, p, k);

%number of data points n :
r = length(N); %  = len(E) = len(H) :: number of control points
r2 = length(x); % number of all the data points


%first iteration values

A = getA_control(IP, xc, yc, zc, R, drw, drp, drk, r);

L = getL(IP, xc, yc, zc, E, N, H, R, r);

dx = getdx(A,L);

ENH = getCoords(x, y, z, IP, R, r2);

deviations = getDeviations(A, L, dx);


%%%%-------------------------------------%%%
iterations = 7;
for m = 1: iterations
  % all shifts above equal to
  IP = IP+dx;

  w = IP(2,1);
  p = IP(3,1);
  k = IP(4,1);

  R = getR(w, p, k); %get a new rotational

  drw = getOmegaDiff(w, p, k);

  drp = getPhiDiff(w, p, k);

  drk = getKappaDiff(w, p, k);

  A = getA_control(IP, xc, yc, zc, R, drw, drp, drk, r);

  L = getL(IP, xc, yc, zc, E, N, H, R, r);

  dx = getdx(A,L);

  % --------------------- accuracy check  ------------------------ %
  
  deviations = getDeviations(A, L, dx)
  
  m

  if m == iterations
    format long
    ENH = getCoords(x, y, z, IP, R, r2)
  end
end


