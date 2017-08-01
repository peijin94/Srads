% author : pjer
% acroding to bleien offical document
% date : 2017-07-29 23:02:35 
% plot .fits data

function [data, t_axes_base, y_axes_base]= srads_plot_bleien(fname)
    % read a fits data and display it
    infom = fitsinfo(fname);
    data = fitsread(fname);
    bdata = fitsread(fname,'binarytable');
    
    key_wd_id = infom.PrimaryData.Keywords(:,1);
    key_wd_val = infom.PrimaryData.Keywords(:,2);
    
    for num = 1:length(key_wd_id)
        word_f = key_wd_id{num};
        news = strrep(word_f,'-','_');
        key_wd_id{num}=news;
        if strcmp(key_wd_id{num},'COMMENT')
            key_wd_id{num}=[];
            key_wd_val{num}=[];
        end
    end
    
    emptyCells = cellfun('isempty', key_wd_id); 
    key_wd_val(all(emptyCells,2),:) = [];
    key_wd_id(all(emptyCells,2),:) = [];
        
    s = cell2struct(key_wd_val,key_wd_id,1);
    x_axes_base = bdata{1};
    y_axes_base = bdata{2};
    
    t_start = datenum([s.DATE_OBS,' ',s.TIME_OBS]); 
    t_end   = datenum([s.DATE_END,' ',s.TIME_END]);
    
    t_axes_base = (x_axes_base-min(x_axes_base))...
        /(max(x_axes_base)-min(x_axes_base))*(t_end-t_start)+t_start;
    
    [X,Y] = meshgrid(t_axes_base,y_axes_base);
    
    
    %imagesc(constback_sub(data));
    
    h=pcolor(X,Y,constback_sub(data));    
    set(h,'edgecolor','none')
     shading interp; 
    colorbar()
    box on;
    title(s.CONTENT);
    xlabel(s.CTYPE1);
    ylabel(s.CTYPE2);
    datetick('x','HH:MM','keeplimits')
    
end