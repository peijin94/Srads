
# Nobeyama Radioheliograph

Nobeyama Radioheliograph (NoRH) is a radio telescope dedicated to observe the Sun. Technical data is shown below.

| Item | Detail |
|------|--------|
| Frequency  | 17GHz (Right and left circular polarization), 34GHz (only intensity) |
| Field of view  |	Solar full disk
Spatial resolution |	10 arcsec (17GHz), 5 arcsec (34GHz)
Temporal resolution	| 0.1 sec (Event), 1 sec (Steady)

So Norh is a complex system, we are here to visualize as much as possible.

What we are analysing mainly stores in the dir '/pub/nsro/norh/images' and we analyze and visualize the data according to official manual (http://solar.nro.nao.ac.jp/norh/doc/man_v33e.pdf)

According to the document the header of the fits data is defined as following:


 | Name | Define |
 |-----|-------|
 | SIMPLE | 'T' if the file subjects to the FITS regulation |
 | BITPIX |  number of bits and type of the data |
 | NAXIS  | number of dimensions of the data |
 | NAXIS1 | number of pixels in x-axis |
 | NAXIS2 | number of pixels in y-axis |
| STARTFRM | the first IDs of used frames |
| ENDFRM    | the last IDs of used frames |
| JST-STRT  | the start time (JST) of integration for STARTFRM |
| JST-END   | the end time (JST) of integration for ENDFRM |
| JST-TIME  | the middle time (JST) of integration for ENDFRM |
| JST-DATE  |exact middle time (JST) between the JST-STRT and JST-END : the date (JST) for JST-STRT. The format is yyyy-mm-dd |
| STRT-OBS  | UT for JST-STRT |
| END-OBS   | UT for JST-END |
| TIME-OBS  | UT for JST-TIME |
| DATE-OBS  | UT for JST-DATE |
| OBJECT | fixed to sun
| TELESCOP | fixed to radioheliograph
| ORIGIN | fixed to nobeyama radio obs
| POLARIZ | choose from rcp, lcp, r+l, r-l, l-r, r|l, (r-l)/(r+l), unknown
| ATT-10DB | choose from 00dB, 10dB
| OBS-MODE | choose from fix, alt
| OBS-FREQ | choose from 17GHz, 34GHz
| FRM-STAT | choose from 1-sec obs, event, calib
| DATA-TYP | brief description of data type, e.g. cleaned map  
| SOLR |  apparent radius of the solar disk |
| SOLP |  polar angle of the sun |
| SOLB |  the heliographic latitude of the solar disk center |
| DEC |  declination of the Sun at Nobeyama |
| HOURA |  hour angle of the Sun at Nobeyama |
| AZIMUTH |  azimuthal angle of the Sun at Nobeyama |
| ALTITUDE |  altitude of the Sun at Nobeyama |
| ZANGLE |  zenith angle of the Sun at Nobeyama |
| PMAT1/2/3/4 |  transformation matrics between the antenna coordinates (on the geosphere|  antenna north is up) and the solar-disk coordinates (on the celestial sphere|  solar-north is up) |

