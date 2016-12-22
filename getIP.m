function IP = getIP(xc, yc, zc, N, E, H)
  % initial parameters are then estimated as:

  IP= zeros(7,1);
  %--------------------------------------%
  %formulated
  % between points a and b
  
  a = 1;
  b = 3;

  % model coordinate shifts
  diff_x = xc(b)-xc(a);
  diff_y = yc(b)-yc(a);

  % object coordinate shifts
  diff_E = E(b)-E(a);
  diff_N = N(b)-N(a);
 
  function lm = getScale()
    %distances
    model_dist = sqrt( diff_x^2 + diff_y^2 ); %in M
    
    ground_dist = sqrt( diff_E^2 + diff_N^2 ); %in M
    
    %scale factor lm:
    lm = (ground_dist / model_dist);
    IP(1,1) = lm;
  end

  % assumed rotations
  IP(2,1) = 0; %omega, w rotation in x-axis
  IP(3,1) = 0; %phi, p rotation in y-axis
  
  function k = getKappa()
    %bearings
    model_brg = atan(diff_x / diff_y);
    ground_brg = atan(diff_E / diff_N);

    k = ground_brg - model_brg; % kappa k, rotation in z
    IP(4,1) = k;
    % kappa k degrees
    kdeg = radtodeg(IP(4,1)) %in degrees
  end

  function enh = getShifts(a, b)
    % a is the chosen point to be used for computation of shift

    lm = getScale();  %get the scale  factor

    % scale the model coords
    sxc = xc * lm;
    syc = yc * lm;
    szc = zc * lm;

    % the three shifts for point a
    e1 = E(a) - sxc(a);
    n1 = N(a) - syc(a);
    h1 = H(a) - szc(a);
    
    e2 = E(b) - sxc(b);
    n2 = N(b) - syc(b);
    h2 = H(b) - szc(b);

    e = (e1 + e2 )/2 ; %e, shift along the x-ax
    n = (n1 + n2 )/2 ; %n, shift along the y-axis
    h = (h1 + h2 )/2 ; %h, shift along the z-axis 

    IP(5,1) = e;  %= (e1 + e2 )/2; %e, shift along the x-axis
    IP(6,1) = n; %(n1 + n2 )/2; %n, shift along the y-axis
    IP(7,1) = h; %(h1 + h2 )/2; %h, shift along the z-axis 
  end

  getScale();
  getKappa();
  getShifts(a,b);

end