# Bleien solar radio data
This is a set of observation instrument including Phoenix-3, Phoenix-4 and e-Callisto, there have already been scripts in SSW(solar software) and some [Java GUI](http://soleil.i4ds.ch/solarradio/data/JavaViewers/) to display the data for quick look in data (not analyzing tool).

Here we also provide a script to decode and display the spectra data saved in fits file.

The script is named as "srads_plot_bleien.m"

Just like srs data, this is also a function and can be called like 

```matlab
srads_plot_bleien('path/to/file/xxxxxx.fit'); 
% just plot

data = srads_plot_bleien('path/to/file/xxxxxx.fit');
% plot it and save intensity infomation to 'data'

[data, t, f] = srads_plot_bleien('path/to/file/xxxxxx.fit'); 
% plot it and save intensity infomation to 'data' and 
% save frequency axis to 'f' and save t axis to 't'
```

And in this script a function to eleminate the background is used, considering the background doesn't change too much so we can eliminate it by remove average from the data, and this function is written as an independent function for other scripts to use.

This function is called "constback_sub.m"

And it can be called as:


```matlab
res = constback_sub(raw);
```