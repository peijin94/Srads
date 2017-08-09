# World Spec Data (Culgoora)
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
