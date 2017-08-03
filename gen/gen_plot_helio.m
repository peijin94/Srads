% author : pjzhang
% used to generte a mesh, or lay a grid on
% imagesc plot
% date : 2017-07-29 23:02:35

function [X,Y] = gen_plot_helio(radius, bangle, roll, gridn)
    hold on
    
    if ~exist('gridn','var')  , gridn = 15; end
    if ~exist('roll','var')   , roll  = 0 ; end
    if ~exist('radius','var') , radius= 1000;end
    if ~exist('bangle','var') , bangle=5; end
    
    varc = -90 + gridn*linspace(0,ceil(180/gridn),(ceil(180/gridn+1)));
    varr = -90 + gridn*linspace(0,ceil(180/gridn),(ceil(180/gridn+1)));
    
    [LAT, LON] = meshgrid(varc, varr); 
    if roll>eps
        do_roll(roll);
    end
    [X,Y] = hel2arcmin(LAT,LON,radius,bangle);
    plot(X(:),Y(:),'.');
    hold off
end
