# **S**olar **Ra**dio  **D**ata processing **s**cripts

 [SRaDs] (**S**)olar (**Ra**)dio  (**D**)ata processing (**s**)cripts

All scripts In order to avoid the comflict with any build in function or script namespace, here we use 'srads_' as prefix

## (1)  SRS File Visualization (Learmonth)

According to official SRS(SOLAR RADIO SPECTROGRAPH)  document from IPS Radio and Space Services, we decode the SRS file and finally visualized it, we can use this script to read and visualize the **Learmonth radio spectrographs** data：

This script is named as "srads_plot_srs.m"

its a function and can be called as:

```matlab
srads_plot_srs('path/to/file/LMxxxxxx.srs'); 
% just plot

data = srads_plot_srs('path/to/file/LMxxxxxx.srs');
% plot it and save intensity infomation to 'data'

[t,f,data] = srads_plot_srs('path/to/file/LMxxxxxx.srs'); 
% plot it and save intensity infomation to 'data' and 
% save frequency axis to 'f' and save t axis to 't'
```

And the data can be selected and downloaded at [Data form](http://www.sws.bom.gov.au/World_Data_Centre/1/9) and it can be downloaded directly via ftp service at ftp://ftp-out.sws.bom.gov.au/wdc/wdc_spec/

Official site of Space weather service also provided a windows(32) version of SRS display software to display the data (not open source) The Software SRSDisplay.exe (can be downloaded from [Tool download site](http://www.sws.bom.gov.au/World_Data_Centre/1/1))

## (2) World Spec Data (Culgoora)
Data from Culgoora can be handled in the same way, so there is another script for it and can be used in the similar way.

This script is named as "srads_plot_spec.m"

Just like srs data, this is also a function and can be called like 

```matlab
srads_plot_spec('path/to/file/SPECxxxxxx'); 
% just plot

data = srads_plot_spec('path/to/file/SPECxxxxxx');
% plot it and save intensity infomation to 'data'

[t,f,data] = srads_plot_spec('path/to/file/SPECxxxxxx'); 
% plot it and save intensity infomation to 'data' and 
% save frequency axis to 'f' and save t axis to 't'
```


And the data can be selected and downloaded at [Data form](http://www.sws.bom.gov.au/World_Data_Centre/1/9) and it can be downloaded directly via ftp service at  ftp://ftp-out.sws.bom.gov.au/wdc/wdc_spec/data/culgoora/raw/

Software tool of displaying the raw data (spec.zip) can also be downloaded from [Tool download site](http://www.sws.bom.gov.au/World_Data_Centre/1/1))

## Bleien solar radio data
This is a set of observation instrument including Phoenix-3, Phoenix-4 and e-Callisto, there have already been scripts in SSW(solar software) and some [Java GUI](http://soleil.i4ds.ch/solarradio/data/JavaViewers/) to display the data for quick look in data (not analyzing tool).


## TODO List
### Things plan to do :
finish data from norh and bleien

prepare demo exmaple set to run the scripts
### Things not in plan but want to do :
prepare optical data visualization and combine it with radio observation


