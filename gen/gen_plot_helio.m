% author : pjzhang
% used to generte a mesh, or lay a grid on
% imagesc plot
% date : 2017-07-29 23:02:35

function [X,Y] = gen_plot_helio(radius, bangle, roll, gridn,center_x,center_y)
    hold on
    
    if ~exist('gridn','var')  , gridn = 15; end
    if ~exist('roll','var')   , roll  = 0 ; end
    if ~exist('radius','var') , radius= 1000;end
    if ~exist('bangle','var') , bangle=5; end
    if ~exist('center_x','var') , center_x=0; end
    if ~exist('center_y','var') , center_y=0; end
    
    varc = -90 + linspace(0,180,gridn);
    varr = -90 + linspace(0,180,gridn);
    
    for num_i = 1:length(varc)
        lon_t = varr(1):0.2:varr(end);
        lat_t = varc(num_i)*ones(1,length(lon_t));
        [xt,yt] = hel2arcmin(lat_t,lon_t,radius,bangle);
        plot(center_x+xt*60,center_y+yt*60,'color',0.6*[1,1,1]);
    end
    
    for num_i = 1:length(varr)
        lat_t = varc(1):0.2:varc(end);
        lon_t = varr(num_i)*ones(1,length(lon_t));
        [xt,yt] = hel2arcmin(lat_t,lon_t,radius,bangle);
        plot(center_x+xt*60,center_y+yt*60,'color',0.6*[1,1,1]);
    end
    
    if roll>eps
        do_roll(roll);
    end
    hold off
end
