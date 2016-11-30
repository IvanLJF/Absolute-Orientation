function IP = getIP(xc, yc, zc, N, E, H)
  % initial parameters are then estimated as:

  %rotations
  w = 0; %omega, rotation in x-axis
  p = 0; %phi, rotation in y-axis
  
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
    lm = ground_dist / (model_dist) 
  end

  function k = getKappa()
    %bearings
    model_brg = atan(diff_x / diff_y);
    ground_brg = atan(diff_E / diff_N);

    k = ground_brg - model_brg
    % kappa k degrees
    kdeg = radtodeg(ground_brg - model_brg) %in degrees
    
    %some test conversions
    % first = radtodeg(atan(diff_x / diff_y));

    % if first < 0
    %   % first + 180;
    %   model_brg = degtorad(first + 180)
    % else
    %   model_brg = atan(diff_x / diff_y)
    % end      


  end

  function enh = getShifts(a, b)
    % a is the chosen point to be used for computation of shift

    lm = getScale();  %get the scale  factor

    % scale the model coords
    sxc = xc * lm;
    syc = yc * lm;
    szc = zc * lm;

    % the three shifts for point a
    e = E(a) - sxc(a);
    n = N(a) - syc(a);
    h = H(a) - szc(a);
      
    enh = [
      e
      n
      h
    ]
  end

  lm = getScale();
  k = getKappa();
  
  enh = getShifts(a,b);
  e = enh(1);
  n = enh(2);
  h = enh(3);
 
  IP = [
    lm
    w
    p
    k
    e
    n
    h
  ];

  % CHECKS %
  % %rotation in z, kappa, k radians
  % k1 = 1.590495551;

  % %scale factor: lambda, lm
  % lm1 = 695.696381

  % %translations
  % e1 = 670149.90;
  % n1 = 222719.71;
  % h1 = 1122.22;

end