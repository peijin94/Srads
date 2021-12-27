pro preprocess_pack_fits,dir_name,f_name,out_put_dir,f_id=f_id

  OPEN_ROU_A, dir_name,f_name, x,xf,xts,xt, date_obs,h1,m1,s1, h2,m2,s2,/quiet
  size_x = size(x)

  size_freq = size(x)
  freq_idx_len = size_freq(1)
  time_idx_len = size_freq(3)

  left_data  = reform(transpose(x[*,0,*]),[time_idx_len,freq_idx_len])
  right_data = reform(transpose(x[*,1,*]),[time_idx_len,freq_idx_len])

  year_obs = strmid(date_obs,6,2)
  mon_obs = strmid(date_obs,3,2)
  day_obs = strmid(date_obs,0,2)

  if year_obs GT '90' then begin
    pre_d = '19'
  endif  else begin pre_d = '20'
endelse

real_time = pre_d+year_obs+'/'+mon_obs+'/'+day_obs

t1 = reform(xts[*,0])+anytim(real_time)
t2 = reform(xts[*,1])+anytim(real_time)

  fname_l = 'output'+'_l'+'.fits'
  mkhdr,header_f1 , left_data
  sxaddpar,header_f1 , 'f1',min(xf),'lower limit of freq'
  sxaddpar,header_f1 , 'f2',max(xf),'upper limit of freq'
  sxaddpar,header_f1 , 't_start',min(xts),'start of obs (seconds from 00:00:00)'
  sxaddpar,header_f1 , 't_end'  ,max(xts),'end of obs (seconds from 00:00:00)'
  sxaddpar,header_f1 , 'date_obs', real_time,'date of obs'
  writefits,out_put_dir+'/'+fname_l,left_data,header_f1


  fname_r = 'output'+'_r'+'.fits'
  mkhdr,header_f2 , right_data
  sxaddpar,header_f2 , 'f1',min(xf),'lower limit of freq'
  sxaddpar,header_f2 , 'f2',max(xf),'upper limit of freq'
  sxaddpar,header_f2 , 't_start',min(xts),'start of obs (seconds from 00:00:00)'
  sxaddpar,header_f2 , 't_end'  ,max(xts),'end of obs (seconds from 00:00:00)'
  sxaddpar,header_f2 , 'date_obs', real_time,'date of obs'
  writefits,out_put_dir+'/'+fname_r,right_data,header_f2

end