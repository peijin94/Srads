; a simple demo
; 

dir_name = 'D:\acad\data\nancy\20170810_135723\'
f_name = 'S170605.RT1'
; file name and directory name are both needed

; compile the scripts used to make sure the changes are applied
.compile open_rou_a
.compile srads_plot_nancy

; some ways of using the script
; 
; all by defult
window,0
srads_plot_nancy,dir_name,f_name
; 
; plot spectra with user defined time range
window,1
srads_plot_nancy,dir_name,f_name,t_range=['08:56:00','09:04:00']
;
; plot spectra with user defined time range and freq range 
window,2
srads_plot_nancy,dir_name,f_name,t_range=['08:57:00','08:59:00'], f_range = [10,30]