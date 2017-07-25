% author : pjer
% acroding to SRS offical document
% date : 2016-11-29 23:02:35 
% plot .srs data

function plot_srs(fname)
    close all
    if nargin == 0
        fname = 'D:\acad\data\wdc_spec\LM071231.srs';
    end
    fileid = fopen(fname);  
    A = fread(fileid,'*uint8');
    num_len = length(A)/826;
    fileid = fopen(fname);
    
    
    b1_all = zeros(401,num_len);
    b2_all = zeros(401,num_len);
    
    t_y = zeros(1,num_len);
    t_m = zeros(1,num_len);
    t_d = zeros(1,num_len);
    t_H = zeros(1,num_len);
    t_M = zeros(1,num_len);
    t_S = zeros(1,num_len);
    
    
    
        n_site  =  zeros(1,num_len);
        n_bands =  zeros(1,num_len);
    
        b1_f_start  =  zeros(1,num_len);
        b1_f_end    =  zeros(1,num_len);
        b1_f_num    =  zeros(1,num_len);
    
        b1_ref_l    =  zeros(1,num_len);
        b1_ref_a    =  zeros(1,num_len);
    
        b2_f_start  =  zeros(1,num_len);
        b2_f_end    =  zeros(1,num_len);
        b2_f_num    =  zeros(1,num_len);
    
        b2_ref_l    =  zeros(1,num_len); 
        b2_ref_a    =  zeros(1,num_len); 
    
        names_i = {'Palehua';'Holloman';'Learmonth';'San Vito'};

    
    for num = 1:num_len
        t_y(num)  =  fread(fileid,1,'*uint8');
        t_m(num)  =  fread(fileid,1,'*uint8');
        t_d(num)  =  fread(fileid,1,'*uint8');
        t_H(num)  =  fread(fileid,1,'*uint8');
        t_M(num)  =  fread(fileid,1,'*uint8');
        t_S(num)  =  fread(fileid,1,'*uint8');
        n_site(num)  =  fread(fileid,1,'*uint8');
        n_bands(num) =  fread(fileid,1,'*uint8');
    
        b1_f_start(num)  =  fread(fileid,1,'*uint16');
        b1_f_end(num)    =  fread(fileid,1,'*uint16');
        b1_f_num(num)    =  fread(fileid,1,'*uint16');
    
        b1_ref_l(num)    =  fread(fileid,1,'*int8');
        b1_ref_a(num)    =  fread(fileid,1,'*int8');
    
        b2_f_start(num)  =  fread(fileid,1,'*uint16');
        b2_f_end(num)    =  fread(fileid,1,'*uint16');
        b2_f_num(num)    =  fread(fileid,1,'*uint16');
    
        b2_ref_l(num)    =  fread(fileid,1,'*int8');
        b2_ref_a(num)    =  fread(fileid,1,'*int8');
    
        b1_all(:,num) = fread(fileid,401,'*uint8');
        b2_all(:,num) = fread(fileid,401,'*uint8');
        
    end
    hf = figure();
    t= datetime(t_y+2000,t_m,t_d,t_H,t_M,t_S);
    data = [b1_all;b2_all];
    numrical_t = datenum(t);
    f1 = linspace(25,75,401);
    f2 = linspace(75,180,401);
    f = [f1,f2];
    [T,F] = meshgrid(numrical_t,f);
    h=pcolor(T,F,data);
    colormap(jet)
    set(h,'edgecolor','none')
     %shading interp; 
    colorbar()
    datetick('x','HH:MM:SS','keeplimits')
    title(['Site : [',names_i{n_site(1)},']  during [',datestr(t(1)),']~[',datestr(t(end)),']'])
    set(hf,'Position',[0 0 780 500]);
end