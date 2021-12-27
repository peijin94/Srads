function [data,info] = opt_plot_aia(fname,posi,sizex,sizey)
    if ~exist('sizex','var'), sizex = 0; end
    if ~exist('sizey','var'), sizey = sizex; end
    if ~exist('fname','var'), fname = 'aia.lev1.304A_2012-02-12T00_25_08.12Z.image_lev1.fits' ;end
    
    data = fitsread(fname,'image');
    info = fitsinfo(fname);
    kw = info.Image.Keywords;
    disp(kw)
    imagesc(data)
end