
# (1)  SRS File Visualization (Learmonth)

According to official SRS(SOLAR RADIO SPECTROGRAPH)  document from IPS Radio and Space Services, we decode the SRS file and finally visualized it, we can use this script to read and visualize the **Learmonth radio spectrographs** data?

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
