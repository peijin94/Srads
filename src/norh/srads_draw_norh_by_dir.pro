; a procedure to make movie of an event from a standard dir

pro srads_draw_norh_by_dir,sup_dir,year_type = year_type
  
  zfiles  =  file_search(sup_dir+'ipz*')
  afiles  =  file_search(sup_dir+'ipa*')
  sfiles  =  file_search(sup_dir+'ips*')
  
  full_sun_file  =  file_search(sup_dir+'ifa*');
  dname=!d.name
  xsize=1200
  ysize=1000
  fps=5

  
  loadct,15
  ;39
  
  for i=0,10 do begin
    set_plot,'win'
    ;device, filename = 'new.png'
    window,2,xsize=xsize,ysize=ysize
    ;device, set_resolution=[1280,1920]
    device, decomposed=0


    norh_rd_img,full_sun_file[0],indexf,dataf
    norh_rd_img,afiles[i],indexa,dataa
    norh_rd_img,zfiles[i],indexz,dataz
    norh_rd_img,sfiles[i],indexs,datas

    fi17=norh_tb2flux(dataa,indexa,/intensity)
    fv17=norh_tb2flux(datas,indexs,/intensity)
    norh_polariz,indexa,fi17,indexs,fv17,indexp,pol,mvdp
    norh_index2map,indexp,-pol*mvdp,mappol

    !p.multi = [4,2,2,0,0]

    norh_plot,indexf,dataf,/nobeam,xtitle='X(arcsec)',ytitle='Y(arcsec)'
    norh_plot,indexa,dataa,indexp,pol,mvdp,/nobeam,xtitle='X(arcsec)',ytitle='Y(arcsec)'

    plot_map,mappol ,/cont,levels=(findgen(1,61)-30)/50,C_COLORS = indgen(50)*5.1+1
    x0=!x.window(0) & dx=!x.window(1)-!x.window(0)
    y0=!y.window(0) & dy=!y.window(1)-!y.window(0)

    color_bar,x0+dx*0.2,x0+dx*0.8,y0+dy*0.1,y0+dy*0.13,/normal $
      ,tickname=['-0.6','-0.3','0','0.3','0.6'] $
      ,ticks=4,color=lcolor,xcharsize=charsize_cb

    norh_plot,indexz,dataz,/nobeam,xtitle='X(arcsec)',ytitle='Y(arcsec)'

   file_mkdir,'img/'
   str_fname = 'img/pic_' + num2str(i) + '.png'
   ;print,str_fname

   WRITE_PNG, str_fname , TVRD(/true)
   im=tvrd(true=1)

  endfor
  
  
  set_plot,dname
  
  
  images = file_search('img/*')
  
  image2movie,images,/mpeg
end