% there are 2 bit of data describing a 'double number' but not in standard
% double way, so I use this function to take in 2 bit of data and reformit
% into a double length data

function res = uint_num_join(num_arr)
    res  = double(256*uint16(num_arr(1))+uint16(num_arr(2)));
end