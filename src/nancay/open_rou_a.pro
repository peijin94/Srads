;-----------------------------------------------------------------------
; read nancy routine-1 data
; P.J.Zhang reversion of  P. Zarka, 2016's code
; 
; date : 2017-8-10
; 
;-----------------------------------------------------------------------
Function DELPATH, str
;-----------------------------------------------------------------------
; Remove the path ahead of the file name
;-----------------------------------------------------------------------
if float(!version.release) ge 5.6 then  $
  p = max([strpos(str,'/',/reverse_search),strpos(str,':',/reverse_search)])  $
else $
  p = max([rstrpos(str,'/'),rstrpos(str,':')])
; print, strmid(str,p+1,strlen(str)-p)
return,strmid(str,p+1,strlen(str)-p)
end
;-----------------------------------------------------------------------
  Function hs_visu, h			; hh,mm,ss,cc -> sec
;-----------------------------------------------------------------------
  return, total(transpose(h)#[3600.0,60.0,1.0,0.01])
  end
;-----------------------------------------------------------------------
  Function nombre, str			; conversion ascii -> binary
;-----------------------------------------------------------------------
  return, long(total(transpose(byte(str)-48)#10^reverse(indgen(strlen(str)))))
  end
;-----------------------------------------------------------------------
  pro OPEN_ROU_A, path, nom_fichier, x,xf,xts, xt, date_obs, h1,m1,s1, h2,m2, s2, QUIET=QUIET, COR=COR
;-----------------------------------------------------------------------
;  Reading NDA Routine data (2 polars)
;-----------------------------------------------------------------------
  openr, unit, path+nom_fichier, /block, /get_lun
 
 ; prepare to read header
 
  lg = 405L
  nada = 0B & f1 = bytarr(2) & f2 = bytarr(2)
  resol = '   ' & nivref = '   ' & speed = '     ' & dbdiv = '  '
  hmer = '  ' & mmer='  ' & filt1=' ' & hfilt1='  ' & mfilt1='  ' & filt2=' ' & hfilt2='  ' & mfilt2='  '
  null_time = '     '
  date_obs = '        '
  date_obs_end = '        '
  time_end = '     '
  readu, unit, nada, f1, f2, resol, nivref, speed, dbdiv, hmer,$
    mmer, filt1,hfilt1,nada,mfilt1, filt2,hfilt2,nada,mfilt2,nada,null_time,nada,$
    date_obs, nada, date_obs_end, nada, time_end
  print,hfilt2
; variables 
; f1      : min Freq(MHz)
; f2      : max Freq(MHz)
; resol   : Resolution (KHz): 3 characters
; nivref  : Reference Level (Dbm): 3 characters
; speed   : Scanning speed (mS): 5 characters (*)
; dbdiv   : Scale (dB / div): 2 characters
; hmer    : time H
; mmer    : time M
; filt1   : RF Filter Start: 1 character
; hfilt1  : Start H filter: 2 characters
; nada    : ':'
; mfilt1  : First m time: 2 characters
; filt2   : RF filter second change: 1 character
; hfilt2  : Secon H time: 2 characters
; nada    : ':'
; mfilt2  : Second M time: 2 characters
;
; 


  if dbdiv ne '10' then begin
    speed = '   '
    point_lun, unit, 0
    readu, unit, nada, f1, f2, resol, nivref, speed, dbdiv, hmer,mmer, filt1,hfilt1,nada,mfilt1, filt2,hfilt2,nada,mfilt2
  endif
  fmin = float(nombre(f1)) & fmax = float(nombre(f2)) 
  xf=fltarr(400) & xf = fmin + indgen(400)*(fmax-fmin)/399.
  if ~keyword_set(QUIET) then print
  if ~keyword_set(QUIET) then print, 'fmin,fmax (MHz)=',fmin, fmax
  if ~keyword_set(QUIET) then print, 'Resol (kHz)=',resol,'   Niv.Ref (dBm)=',nivref
  if ~keyword_set(QUIET) then print, 'speed (ms)=',speed,'   dB/div=',dbdiv
  if ~keyword_set(QUIET) then print, 'h,m meridien=',hmer,':',mmer
  status=fstat(unit)	& xns=(status.size*1.d0-lg)/lg/2 & ns=long(xns)
  val=assoc(unit,bytarr(lg,2),lg)
  x=val(0)	& hr_debut= reform(x(0:3,0))	& debut=hs_visu(hr_debut)
  x=val(ns-1)	& hr_fin= reform(x(0:3,0))	& fin=hs_visu(hr_fin)
  if fin lt debut then fin=fin+86400.
  duree=fin-debut
  if ~keyword_set(QUIET) then print, 'h,m,s,c, debut=', hr_debut
  if ~keyword_set(QUIET) then print, 'h,m,s,c, fin  =', hr_fin
  if ~keyword_set(QUIET) then print, 'Debut,Fin,Duree =', debut, fin, duree
  if ~keyword_set(QUIET) then if xns eq ns then print, 'Nspectres(G&D) = 2 *', xns else print, 'Nspectres(G&D) = 2 *', xns, '   ***'
  dt=duree/(ns-1)/2
  if ~keyword_set(QUIET) then print, 'Duree/spectre/polar =', dt
  ts=findgen(ns)*2*dt+debut
  an=fix(strmid(delpath(nom_fichier),1,2))
  if an lt 90 then an=an+2000 else an=an+1900
  mo=fix(strmid(delpath(nom_fichier),3,2))
  if an gt 2000 or (an eq 2000 and mo ge 11) then begin
    if filt2 eq '0' then if ~keyword_set(QUIET) then print, 'Pas de changement de filtre'
    if filt2 ne '0' then begin
      tfilt2=float(hfilt2)*3600.+float(mfilt2)*60.
      if tfilt2 lt debut then tfilt2=tfilt2+86400.
      w=where(abs(ts-tfilt2) eq min(abs(ts-tfilt2)))
      w=long(w(0))
      if ~keyword_set(QUIET) then print, 'Changement de filtre a ',hfilt2,':',mfilt2,'   (spectre ',w,')'
    endif
  endif
  if ~keyword_set(QUIET) then print
  Ndeb=0L & Nfin=ns-1L
  if n_elements(h1) ne 0 then begin
    tdeb=float(h1)*3600.+m1*60.+s1
    if tdeb lt debut then tdeb=tdeb+86400.
    Ndeb=where(abs(ts-tdeb) eq min(abs(ts-tdeb)))
    Ndeb=Ndeb(0)
  endif
  if n_elements(h2) ne 0 then begin
    tfin=float(h2)*3600.+m2*60.+s2
    if tfin lt debut then tfin=tfin+86400.
    Nfin=where(abs(ts-tfin) eq min(abs(ts-tfin)))
    Nfin=Nfin(0)
  endif
  nn=Nfin-Ndeb+1
  if ~keyword_set(QUIET) then print,nn,' spectres lus   :',Ndeb,' ->',Nfin
  x=bytarr(lg,2,nn)
  point_lun, unit, Ndeb*lg*2+lg
  readu, unit, x
  xt=x(0:3,*,*)
  x=x(4:403,*,*)
  xts=dblarr(nn,2)
  for i=0L,nn-1L do xts(i,0)=hs_visu(double(reform(xt(*,0,i))))
  for i=0L,nn-1L do xts(i,1)=hs_visu(double(reform(xt(*,1,i))))
  if ~keyword_set(QUIET) then help,x,xf,xts
  close, unit & free_lun, unit
  return
  end

