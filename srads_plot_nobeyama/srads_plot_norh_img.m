% author : pjer
% acroding to Nobeyama offical document
% date : 2017-08-01 23:02:35 
% plot .fit data

function [data,info] = srads_plot_norh_img(fname)
    if nargin < 1
        fname = '/Users/jing/Desktop/DATA/norh/ipa050803_024206';
        % for debug just ignore it 
    end
    
    data_tmp = fitsread(fname);
    data_inf = fitsinfo(fname);
    
    data = data_tmp;
    
    info = data_inf;
end
