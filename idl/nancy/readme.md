# A tool to visualize Nancy spectrum data

### Procedures：

- srads_plot_nancy.pro 

  ```idl
  srads_plot_nancy,dir_name,f_name,t_range=t_range,f_range=f_range,t_ratio=t_ratio
  ```

  main procedure to visualize the data.


- open_rou_a.pro

  ```idl
   OPEN_ROU_A, path, nom_fichier, x,xf,xts, xt, date_obs, h1,m1,s1, h2,m2, s2, QUIET=QUIET, COR=COR
  ```

  a script to decode data, based on official provided script and made a little contribution of debug and add some comment


- tmp_script.pro

  ``` idl
  @tmp_script
  ```

  a script to run a simple demo (you should download data first)







Format of data:
Header block: 405 bytes (string giving the analyzer settings)

Dummy: 1 character
(-) Fmin (MHz): 2 characters
(-) Fmax (MHz): 2 characters
(-) Resolution (KHz): 3 characters
(-) Reference Level (Dbm): 3 characters
(-) Scanning speed (mS): 5 characters (*)
(-) Scale (dB / div): 2 characters
(-) Meridian time: 2 characters
(-) Minute meridian: 2 characters
(-) RF Filter Start: 1 character
(-) Start time filter: 5 characters (hh: mm)
(-) RF filter first change: 1 character
(-) First change time: 5 characters
(-) RF filter second change: 1 character
(-) Second change time: 5 characters
(-) Date of meridian: 10 characters
(-) Start date of observation: 9 characters
(-) Time of end of observation: 6 characters
(-) TBD: 340 characters (to be defined)

Data blocks: 405 bytes
(-) Time: 1 byte
(-) Minute: 1 byte
(-) Second: 1 byte
(-) Hundredths: 1 byte
(-) Spectrum: 400 bytes
(-) Status tracking: 1 byte