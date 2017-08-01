% author : pjer
% acroding to SPEC offical document
% date : 2017-07-25 23:02:35 
% plot .fits data

function [data,t,f] = srads_plot_spec(fname)
    if nargin<1
        fname = 'SPEC050101';
    end
    fileid = fopen(fname);
    A = fread(fileid,'*uint8');
    num_len = length(A)/2044.0;
    fclose(fileid);
    close all
    fileid = fopen(fname);
    data = zeros(num_len,2004);
    
    t_y = zeros(1,num_len);
    t_m = zeros(1,num_len);
    t_d = zeros(1,num_len);
    t_H = zeros(1,num_len);
    t_M = zeros(1,num_len);
    t_S = zeros(1,num_len);
    
for    num = 1:num_len
    t_y(num)  =  fread(fileid,1,'*uint8');
    t_m(num)  =  fread(fileid,1,'*uint8');
    t_d(num)  =  fread(fileid,1,'*uint8');
    t_H(num)  =  fread(fileid,1,'*uint8');
    t_M(num)  =  fread(fileid,1,'*uint8');
    t_S(num)  =  fread(fileid,1,'*uint8');
            
    data_OK = fread(fileid,1,'*uint8');
    unuse_D = fread(fileid,1,'*uint8');
    
    CH_start_1 = uint_num_join(fread(fileid,2,'uint8'));
    CH_end_1   = uint_num_join(fread(fileid,2,'uint8'));
    CH_res_1   = uint_num_join(fread(fileid,2,'uint8'));
    
    ref_L_1 = fread(fileid,1,'*uint8');
    ref_R_1 = fread(fileid,1,'*uint8');
    
    
    CH_start_2 = uint_num_join(fread(fileid,2,'uint8'));
    CH_end_2   = uint_num_join(fread(fileid,2,'uint8'));
    CH_res_2   = uint_num_join(fread(fileid,2,'uint8'));
    
    ref_L_2 = fread(fileid,1,'*uint8');
    ref_R_2 = fread(fileid,1,'*uint8');
    
    
    CH_start_3 = uint_num_join(fread(fileid,2,'uint8'));
    CH_end_3   = uint_num_join(fread(fileid,2,'uint8'));
    CH_res_3   = uint_num_join(fread(fileid,2,'uint8'));
    
    ref_L_3 = fread(fileid,1,'*uint8');
    ref_R_3 = fread(fileid,1,'*uint8');
    
    
    CH_start_4 = uint_num_join(fread(fileid,2,'uint8'));
    CH_end_4   = uint_num_join(fread(fileid,2,'uint8'));
    CH_res_4   = uint_num_join(fread(fileid,2,'uint8'));
    
    ref_L_4 = fread(fileid,1,'*uint8');
    ref_R_4 = fread(fileid,1,'*uint8');
    
    data(num,:) = fread(fileid,2004,'uint8');
end
    t_y_real =  double(t_y)+2000;
    t_y_real(t_y_real>2060) =  t_y_real(t_y_real>2060) -100;
    t= datetime(t_y_real,t_m,t_d,t_H,t_M,t_S);
    numrical_t = datenum(t);
    f1 = linspace(CH_start_1,CH_end_1,501);
    f2 = linspace(CH_start_2,CH_end_2,501);
    f3 = linspace(CH_start_3,CH_end_3,501);
    f4 = linspace(CH_start_4,CH_end_4,501);
    f = [f1,f2,f3,f4];
    [T,F] = meshgrid(numrical_t,f);
    h=pcolor(T,F,data');
    colormap(jet)
    set(h,'edgecolor','none')
     %shading interp; 
     shading flat
    colorbar()
    xlabel('Time  (UT)')
    ylabel('Frequency  (Hz)')
    title(['Australia IPS Spectrograph (date:',datestr(t(1)),')'])
    datetick('x','HH:MM:SS','keeplimits')
end