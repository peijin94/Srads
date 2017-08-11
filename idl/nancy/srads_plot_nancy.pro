;-------------------------------------------------------
; to vis nancy data
; uses the open_rou_a to read the data and visualize it 
; Author: PJZhang
; date : 2017-8-10
;-------------------------------------------------------

; t_range can be set or not

pro srads_plot_nancy,dir_name,f_name,t_range=t_range,f_range=f_range,t_ratio=t_ratio
  dname=!d.name
  ; read the original binary data
  OPEN_ROU_A, dir_name,f_name, x,xf,xts,xt, date_obs,h1,m1,s1, h2,m2,s2,/quiet
  size_freq = size(x) 
  freq_idx_len = size_freq(1)
  time_idx_len = size_freq(3)

  left_data  = reform(transpose(x[*,0,*]),[time_idx_len,freq_idx_len])
  right_data = reform(transpose(x[*,1,*]),[time_idx_len,freq_idx_len])
  
  year_obs = strmid(date_obs,6,2)
  mon_obs = strmid(date_obs,3,2)
  day_obs = strmid(date_obs,0,2)
  
  if year_obs GT '90' then begin
     real_time = '19'+year_obs+'/'+mon_obs+'/'+day_obs
  endif  else begin  real_time = '20'+year_obs+'/'+mon_obs+'/'+day_obs
  endelse
  t1 = reform(xts[*,0])+anytim(real_time)
  t2 = reform(xts[*,1])+anytim(real_time)

  ; make time range all right
  if keyword_set(f_range) then  begin
    yr = f_range
    endif  else begin
    yr = [min(xf),max(xf)]
  endelse
  
  if keyword_set(t_range) then  begin
    if keyword_set(t_ratio) then begin
      tr = t_range*(max(t1)-min(t1))+min(t1)
    endif else begin
      tr = anytim(t_range)+anytim(real_time)
    endelse
    
  endif  else begin
    tr = [min(t1),max(t1)]
  endelse

;  device,xsize=1000,ysize=820
  
  !p.multi = [2,1,2,0,0]
  spectro_plot,right_data,t2,xf,yrange=yr , timerange=tr , /ystyle,/xstyle,$
    title='Right handed Polarization'
  spectro_plot,left_data ,t2,xf,yrange=yr , timerange=tr , /ystyle,/xstyle,$
    title='Left handed Polarization'
    
  XYOUTS, min(tr), 85, 'Nancy Decameter Array' , CHARSIZE = 1.6
    
  !p.multi = 0
  
  setplot,dname
end
