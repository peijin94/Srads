fname='../../../int_orf20130706_000000_0.1.fts';

infom = fitsinfo(fname);

bdata = fitsread(fname,'binarytable',1);