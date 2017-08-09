sup_dir = 'D:\acad\data\_Database\solar-pub.nao.ac.jp\pub\nsro\norh\images\event\20140129_0446\'
fnamef =  sup_dir+"ifa140129_044635"
fnamea =  sup_dir+"ipa140129_044623";
fnames =  sup_dir+"ips140129_044623";
fnamez =  sup_dir+"ipz140129_044623";

  set_plot,'win'
  ;device, filename = 'new.png'
  window,2,xsize=1200,ysize=1000
  ;device, set_resolution=[1280,1920]
  device, decomposed=0
  

  norh_rd_img,fnamef,indexf,dataf
  norh_rd_img,fnamea,indexa,dataa
  norh_rd_img,fnamez,indexz,dataz
  norh_rd_img,fnames,indexs,datas

  fi17=norh_tb2flux(dataa,indexa,/intensity)
  fv17=norh_tb2flux(datas,indexs,/intensity) 
  norh_polariz,indexa,fi17,indexs,fv17,indexp,pol,mvdp
  norh_index2map,indexp,-pol*mvdp,mappol
  
  !p.multi = [4,2,2,0,0]
  
  loadct,15
  ;39
  
  norh_plot,indexf,dataf,/nobeam,xtitle='X(arcsec)',ytitle='Y(arcsec)'
  norh_plot,indexa,dataa,indexp,pol,mvdp,/nobeam,xtitle='X(arcsec)',ytitle='Y(arcsec)'
  
  plot_map,mappol ,/cont,levels=(findgen(1,61)-30)/50,C_COLORS = indgen(50)*5.1+1
  x0=!x.window(0) & dx=!x.window(1)-!x.window(0)
  y0=!y.window(0) & dy=!y.window(1)-!y.window(0)
  
    color_bar,x0+dx*0.2,x0+dx*0.8,y0+dy*0.1,y0+dy*0.13,/normal $
      ,tickname=['-0.6','-0.3','0','0.3','0.6'] $
      ,ticks=4,color=lcolor,xcharsize=charsize_cb

    norh_plot,indexz,dataz,/nobeam,xtitle='X(arcsec)',ytitle='Y(arcsec)'
  
  WRITE_PNG, 'img/pic_'+num2str(2)+'.png', TVRD(/true)

!p.multi=0