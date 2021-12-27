% author : pjer
% a small tool to translate heliograph coordinate to cartistan in arcmin 
% date : 2017-08-04 

function [x,y] = hel2arcmin(ns,ew,radius,b0)
        
% radius in arcsec %

    radeg = pi./180;
    colat = (90-ns).*radeg;
    lon = ew.*radeg;
    
    robs = 1.d0./tan(radius.*radeg./60./60);
    b0_r = b0.*radeg;
    
    scl = sin(colat);
    ccl = cos(colat);
    cb0 = cos(b0_r);
    sb0 = sin(b0_r);
    sl = sin(lon);
    cl = cos(lon);
    
    xcoord = sb0 .* ccl + cb0 .* cl .* scl;
    x = atan( scl .* sl./(robs-xcoord)) ./ radeg .* 60.d0;
    y = atan( (-scl.*cl.*sb0 + ccl.*cb0)./ (robs-xcoord)) ./ radeg .* 60.d0;
    
end

